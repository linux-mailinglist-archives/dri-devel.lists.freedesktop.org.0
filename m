Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2152430D
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 05:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0303910EEDF;
	Thu, 12 May 2022 03:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3C410EEF2;
 Thu, 12 May 2022 03:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOsKcKVfw/K+9M0TnwI4b2gfeKewDPgrxIJVqOBTNvHtoECRvQpgKpFAJy1q7rKQmNNg+yjkA17nhmmWZJ6UDQAJv50/jXIhdL6TfHF+jVps0z2cmYsJ6d83yw5crWGyVo1mqvLPRhm4qRZi9+mqZU2iqbz1G/gkyeJf+pMF7GcLJP3g+7/cm1VdVL8I3jhYuDclvnaQGRUhp5yN5hBJjxic0dyLTjWCSNHZd5p3xMZCmmPJ+1LGTs8zuwlmpZzCDnkdUU0khJvRrhJJGsaC2O9NGjbs6mQ0AeakvoP2y+q8NlzucDRe9JJk2tWubbkDxHay9t6LdxkUWwXbgQNp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6zT2D9VN9oV3F7/KNGqO4SSdbSkt1pf7XgcUA4q9dA=;
 b=SxEYcNH1+PBQRtlVU2i1Nkd84iI8I5aL3zn/sbkxijLBWrO0e4i/pVaDGZqPo74EJF44swu1yCX7jd8MVGHiGd4bOoKQWM58/lpt8+9tkO4DWZt9usfE2MPEKzheUa2N1PZ0/kdWu2yvkF4q0wE9v5RS/7/nPyLSK7YTBgFPBwBByvlY94AqUQZVnsZSWq+o97bXJ8H2eurOl1p3K3wiz5mgyom6fwu8Kkszi2vjdyZCDlnpRWAVebM2Vo9F8K565Wf4rjnWw+cdezoclf4Q7HnmnXyroBSVR/RrcYCaxJ/n1+Zsha0StU4Y/NWKD9CqMNhu9qfuhsgVjW6SyR2ikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6zT2D9VN9oV3F7/KNGqO4SSdbSkt1pf7XgcUA4q9dA=;
 b=AB1EX9OduTh/E8NFdiEjihv1gxyMPX2ewn2D7X9pNsMLzMhtP6aqdfNWa3mYWBWSK1mFjlzHUOrJ6qCdxB63uYaw9fLRchzlSFui0oorSZs7UkOeE2LdgC4O+auK8UShuUEJCUhjX+Zt9MJbg1FTPIc0tJ4pFR6/rjJANCnrwO/DLt6nbwWTxVFAebZ4VxtLKECAt73VF6kHExlrQ5l/1VCC9B41zGtRiKzmjL5cpwkXhIyxY5oOrnXISaAV3NQ6f/Ut5fPEbAKpj1zvAq49/11ew6H8zJ5myxgnn42y+jsM2HyXjHDFAEd7cIJq1Gbl8RGIsR8nXYAn14boTS+olg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MWHPR12MB1838.namprd12.prod.outlook.com (2603:10b6:300:106::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 03:11:06 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::2d17:b68a:e101:4c18]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::2d17:b68a:e101:4c18%6]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 03:11:06 +0000
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-2-alex.sierra@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Subject: Re: [PATCH v1 01/15] mm: add zone device coherent type memory support
Date: Thu, 12 May 2022 12:58:00 +1000
In-reply-to: <20220505213438.25064-2-alex.sierra@amd.com>
Message-ID: <87bkw3qwc8.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef979c7f-7b4a-4b30-f23a-08da33c50dda
X-MS-TrafficTypeDiagnostic: MWHPR12MB1838:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1838C5481D5B4DAF5B499FA0DFCB9@MWHPR12MB1838.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iAa9vp+1oPJ74r5xCRsAD3reJr0xuxJksxtnU9bG25jd4IZgHbPMCcAu7v8zayxnR/ddb5ADkFNKJYgYIyPNtfEXVnzzq0Xb4B7WjYoTAhJqiodwq/uI0axOMTO9xLsET7NnuSgDDw5xyKq5/9QJR6DmZFQScIzeEN2ROq/ClV3MEcUtRtoi/iOzJvhMj35J7QIpH/2Q3cdNy1ZvbtkId6dUDrfJKKym266VhsFO5kweelmd5aIuarv3jWWyFA3QbDrpNDDLwp3JCz0brBb5gI98lWC8sDS2CKbDqHz/7X4N9qDlR03Ea5b8gJ6sZoG8uc2x5la24gFf5sAedgPWD8n8ZJh+lL7lRmxIfJmuyvdPX7G+1Sokv0s9XfqBWWfTZBLO/kcAqADKt+NQdX54k4gCGuj+Sp7zsZOfN43+4LPoA1jQj6bLVLLJ5uDmaPasm4KSwrYAPxNa9vhce7uoSGmlTvAiMyS7G9KbCdtXRRKCt0K7P8bQUIYniWqDDaFB4G7Rvs72SXRNlM6RuB4qEMzuhgN5d/UEPRjSjm4CZwJ+KEiaR6sr7nosfBfn5Uox5mShEGd9UMuezsEl9AGlzvw9UsO5YC+2CJVKYRK8Z7TozJk3k0lQQAMe/7ZcgR6AUpuYvhEaTWJhlPxx0y8zsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(6506007)(186003)(6916009)(8936002)(26005)(5660300002)(6666004)(66556008)(6512007)(7416002)(66946007)(2906002)(66476007)(9686003)(316002)(8676002)(4326008)(86362001)(6486002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iTcyVnRgKnoKjSkDG+hS9UAssq2A/DHO27DP9SPLKKzmZJfbFi+in81EmXA7?=
 =?us-ascii?Q?/YarpqhZpAdpxk5UUsUaXl6XPwMsuwO1paBzzxtRaClSMfgp5IU/KJKTYExi?=
 =?us-ascii?Q?OmO3hY9D/AS/kBJurjUlwsft47BsEgoZzpulT/SwM5ZZAXb2OGHV6cBy/zdh?=
 =?us-ascii?Q?Mh+qdF3s5Kwj64Y9eln6Chqy0onH/3bf+PFwuyYA7Hg6eHLz9Nyeq2fyGlb+?=
 =?us-ascii?Q?k4cW4VysTHQrhbyCs4FTt0RGpXQfydR1yB4JQq/ifSH7EpXXo0NgyyeZO3Ec?=
 =?us-ascii?Q?AZ2tPpw/BNE9hqe0menLp7SZZAZtnz8Q3USNHxSkPnVWcrgIPZBd171gV9WS?=
 =?us-ascii?Q?pqL9uoyH0PF5ZtInyXaplyWlvB/E+EP4A/qgkes/b2Qq7IggrtpXKXJZZMZ2?=
 =?us-ascii?Q?q+fDOGFsFu2v0MRscl1ZD6udOsT35Mg8S176AwE8B8tTP9phDxDGCX432EMS?=
 =?us-ascii?Q?s8bTf1knKEIUveNToahF/y5O1p0WLOcaP17KTMNtuRzsiVV9RrQ02nbAVQ3f?=
 =?us-ascii?Q?phKLyhyGj/PxKGFkafjKc39Z0fTuZDBEnfgSAoKIUPml8Ath4Rl1kN6cGAAJ?=
 =?us-ascii?Q?7L9XkLQM6Sk0EfLPCMmdCCLhuYDytC+9B7O/P2ztUpXhN4WsPr1b7s4aTbqz?=
 =?us-ascii?Q?LVqw1dl0aDwCPeS8g8mYkHLRTuh78p+MmhKESyKd4po0f6DbHy5xAZtRLVfv?=
 =?us-ascii?Q?Kkkf9BEt0LhHMqRVgckXhCC7G0fcbaJ03efecXPd161JCiHzJ/ggaGzO+aYe?=
 =?us-ascii?Q?wo6Pr3Q/Bmix6NpmJg9fAvL/lew96DZC01vWy3UON3D+9nXMgImzMrkEGwpJ?=
 =?us-ascii?Q?imEFU1LZxCDYtMqdhdUFCNCXqBjda0QVSnrm2p17SZ3wbf+TgRAUGzd37J9q?=
 =?us-ascii?Q?PxtlsyjaoNWbBEPPBQZIj7JpZ3CZMaJGiPCU9dWaSAHhiJkiF//RSSuKBf/2?=
 =?us-ascii?Q?wxj6+mNpNWQ+LVBZoIlVhFUgXscs9PXZjCji5Ra/pmtYY0UqWslaKxW3GOAp?=
 =?us-ascii?Q?hFyf5FYJJtkupNPDMBvTv6pyDVlzj3GUZCKY/rHsKiZBHqQd/ocfV7D42Eb4?=
 =?us-ascii?Q?qFDy3D1pP1Fzduw2aLnsTGP9KesvZOY9xod/2hI+EXUdYkT2GYIDGrx55qyZ?=
 =?us-ascii?Q?4TMCsJ73pLqu01/w+nJoaoa7f0LIVTud3p6OJzcMwcG3ah3FfSiq0YDxvJy7?=
 =?us-ascii?Q?P4oF/7hqC1c14Bk9yy67aa/tsyZF5StwajH1buJJwg3DLBEWwBHGFsAO/qlc?=
 =?us-ascii?Q?TI9xbx4ng5UVbIqXxgW9JhLqxQnmQswyx9aFCE7tT05pcMev7ufAtcBaWun8?=
 =?us-ascii?Q?xNIok2tNW+3RMXtCrJdYjo1lRz3AtLP9T/aUH6wiBbM7OQuATVVmYCm/qtOj?=
 =?us-ascii?Q?hG/ZGtiA8tjyHAH2z/vCo4iZWlMwDaZYBDeM+1s/4ry1ej/OtyBdS43q8VtE?=
 =?us-ascii?Q?0nbrN9qIhTcmK/nBTuhPyMeJSB+y6E5WKRhDKIJjnNzQzZBrPNPmYQxcTwvJ?=
 =?us-ascii?Q?Mn+6hFmrxIk+baRjKpVaYNT0fAr6V9pWMxMxkD+dqTttDO2D14+8kU+HJ2Zl?=
 =?us-ascii?Q?+eN2IgsGxkaxsh8bLLCD1C2TKUFgUHt2my1pApF876/114NC2AhN9S83snqS?=
 =?us-ascii?Q?5zxjf9mfUqOB2LEGJazCRo/AHLbv8StobhigjOhQwI+P26BHI+Yy+jdsUtTS?=
 =?us-ascii?Q?pbqgsPj0uQuCcXGPdTmFNmUKhbWU1zvF7LEE/hiDLAC2zoMHhsWASNVdQk43?=
 =?us-ascii?Q?9391YgyjRw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef979c7f-7b4a-4b30-f23a-08da33c50dda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 03:11:06.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLn2sOjNCmpafpzoGK3/72lY7Bv9S4HEf+mTAv/ap1dLlSoGBaUkiAnCyDQ084RR75Qet7cbnF9B2sLrR3JAlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1838
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Alex Sierra <alex.sierra@amd.com> writes:

[...]

> diff --git a/mm/rmap.c b/mm/rmap.c
> index fedb82371efe..d57102cd4b43 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1995,7 +1995,8 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
>  					TTU_SYNC)))
>  		return;
>
> -	if (folio_is_zone_device(folio) && !folio_is_device_private(folio))
> +	if (folio_is_zone_device(folio) &&
> +	    (!folio_is_device_private(folio) && !folio_is_device_coherent(folio)))
>  		return;
>
>  	/*

I vaguely recall commenting on this previously, or at least intending
to. In try_to_migrate_one() we have this:

		if (folio_is_zone_device(folio)) {
			unsigned long pfn = folio_pfn(folio);
			swp_entry_t entry;
			pte_t swp_pte;

			/*
			 * Store the pfn of the page in a special migration
			 * pte. do_swap_page() will wait until the migration
			 * pte is removed and then restart fault handling.
			 */
			entry = pte_to_swp_entry(pteval);
			if (is_writable_device_private_entry(entry))
				entry = make_writable_migration_entry(pfn);
			else
				entry = make_readable_migration_entry(pfn);
			swp_pte = swp_entry_to_pte(entry);

The check in try_to_migrate() guarantees that if folio_is_zone_device()
is true this must be a DEVICE_PRIVATE page and it treats it as such by
assuming there is a special device private swap entry there.

Relying on that assumption seems bad, and I have no idea why I didn't
just use is_device_private_page() originally but I think the fix is just
to change this to:

		if (folio_is_device_private(folio))

And let DEVICE_COHERENT pages fall through to normal page processing.

 - Alistair
