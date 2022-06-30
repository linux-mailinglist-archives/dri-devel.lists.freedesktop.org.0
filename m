Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 582FE5619D8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 14:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F0811A265;
	Thu, 30 Jun 2022 12:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04B11A264;
 Thu, 30 Jun 2022 12:07:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIB+bKK0HE+uz0woERWlc7Wg5Ka6A+MOllK5cEGQ2ipoUIem+uYUupTCA+GttIoSVPUuMAQPwoe1UalZDNa27NGBKeLdnnhKQKR/nFexn18gFn5cGkCU81Ixr8bZfHFDxykokZO6U2VhwA81vskcpOzL0BoWPElwbWfOOlXtKrDW5TwbukaJNguSYhPI0LoGIxv8IYA11fLHLnsfNxKWrYz+125BHpZkc595G1vK1F7jCpCXsOjrXeEMV1LVPMoeH2lycYFnkc5snVdGZcOui4fNJTEGNwgJl1R143c5E46UV4ED/2Q1iM7NXgwiTIUSO7O29BZkDCKuE3TY/XpfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjNLZ6hwCMaPFnOqw7Yk2MfHYwhAz2ju5n+AJ51mja8=;
 b=eyVU+B74eg6KnVFekzaasi7c3nNVW7pwG2zo8RzpiwNyQd/ePg6N4+alWgRi/IvDQAgofoS+8rkC3SMgxiY/HPWrtpuiCvuUtbcP7sAiBtzwPYEEWTCcaM6XqrUxhr5+yMfpJIjLVZm36Fwj3wFMJBs2AITQiv6j8XQoU2qgK+MccloKqKszBP4OIJcxW1wqaIdLWYcOLI27cIZPCA+kOU7bN7KJ8knaJBi6dXagfmw0PKjwMh1gSxqMg5qdH9wju7PhxaBr8E6YySNRfc5z6GPsu/pHoJNCs+rG3QbpXWmfwMQ28/G65Q43TMNT0KLx0jji7vQuH2koW5d3q/16GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjNLZ6hwCMaPFnOqw7Yk2MfHYwhAz2ju5n+AJ51mja8=;
 b=bNoxRwUMaynhDrTGwEbQ34QRkIH5zGlJPQGKOhhfJFfy7iH2pXAX7h5NH7Qrdbr1hwRHvE0gVPnTQ7pulBN5t7JjQShPiABG8CSJTx15sbU2gtwUQj4/ts5xnX8ZaZSH8PZ1TLJkCl5B/4ck4dKfT2T4vogChNCTDpOh0Dnoi0W2REaFkANkg+6oLnNxrXhyCuewXYK0YmC0LtJo6+aPrG+ShLh7LgSfDqoUgRRaMmLnqGIIyZAW8URxpv7C13J0J9uvnwO3xd2vU3AtelSlC8qYvjl2N7/QWJCO7eCrmrgl3/m3k3c5V+kLDGpa6O36TisAcBIOnc4PRSY1SbGIuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH2PR12MB4838.namprd12.prod.outlook.com (2603:10b6:610:1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 12:07:23 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5373.016; Thu, 30 Jun 2022
 12:07:23 +0000
References: <20220629035426.20013-1-alex.sierra@amd.com>
 <20220629035426.20013-5-alex.sierra@amd.com>
 <956b1c51-b8f1-0480-81ca-5d03b45110f7@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 04/14] mm: add device coherent vma selection for
 memory migration
Date: Thu, 30 Jun 2022 21:44:55 +1000
In-reply-to: <956b1c51-b8f1-0480-81ca-5d03b45110f7@redhat.com>
Message-ID: <878rpe73t3.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06300d03-0f57-4553-8bed-08da5a9116f4
X-MS-TrafficTypeDiagnostic: CH2PR12MB4838:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9JE3Jh3A6R0gdUJBrA9JxQrP5uKpZDw29onv5Rb84jiOwqZByopvf6CT0WRoSkGw0gDlX+wl7Z2C0h8HNI1+vLB+esoZmoltGWG33li0uniGZAeTxKjBjO99LS79qNauq3yZDjTHSVy/GTmPmkybAsiwNqNqNWvJgQ0eCyD4rnHPGbE152Chm/ugM7jocLGSmcAw5cAjvse8Jli0dP/qb4uF//4z/fWV95s90etAVmqB0Yi8CjcXPh2CBALpq02QMtKtpGZfthafeCAL6HRieVUl/cK1gem4DGTd5b4LnkorV/Ogdpokv3Y+bpawxG2OwL2Z+nGrOeaG3FuMo5M8YFuO985zDtHiTWeGGmMsT+xOW1TNiSbEZDddjlCeywHaXWNflYx0KRuJAPw3qnKkFgx0z2yTgYFz6W94DhYv/s3EopdaFG9cuQGTglaMK0oKMVvYWt32AcG+ALHiJOh5sMxy3VpWWicnto1w4bjnbvJ+Fa9wTufjOGyZqEYvGgIHp8EVyBboMpTb/ni6R2mCM2nO38l8w78uJIfHa1VP6EzxYweATb88BNIhLZdPabPVXlAjolflp/ShbncdWP8r6nKNFRMQt4wVpZ489dQ6RkyDoftOuYKeaJyLMYFRcd+qH5Pfr5f+SAXU8hE0Mr62xjbnjXgcZQCFqZSWIEcTBifNEYz7CB9iGfdyIyC0AR6e9BktkKFJ3MAa44qW9jj9Cx8QAMEUnm76bbaUehzYCJHrkuNgO+aUgsKF+XKMbYz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(6506007)(38100700002)(53546011)(86362001)(186003)(8676002)(66556008)(4326008)(66476007)(66946007)(6916009)(478600001)(6486002)(5660300002)(6666004)(41300700001)(2906002)(9686003)(26005)(6512007)(8936002)(7416002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EL6XHlkOJJ/gAiAnT6V4XbS3cAc9nV1M4KKJlmggBs8nR19K8clQSRAwVFNK?=
 =?us-ascii?Q?n5E9TkGAwJ+d8UPZLFbgDZ+DOavgT89/YkjpXxKx/aBlrdCi1hPGrEWAJJdP?=
 =?us-ascii?Q?lIBcrn0X7rQKj1D6cxZV6HRAJMsZ3eogMfwV51Z0x5pi5MmosoRiLqjmO0Nq?=
 =?us-ascii?Q?HknVe5+Exk/SghHtOuLkr5v42+iYeYUnzDgT0RQBN3N8KzAJMBDii/YoyRnW?=
 =?us-ascii?Q?UFkZfNMdBFAVKglMTogWrMwmi9OEEpVsEzcyLqiE6+1w0QV60EFgvuMP04zH?=
 =?us-ascii?Q?GOyadHqv7WBwHzbn4tb7qfM4tihHX1LO6Kss5+4UKCtmAhuKwE/h+q9LcQxi?=
 =?us-ascii?Q?rcv9YjAJ0gQxg7NASPeHm08UsuQG19nvlkt/hwEezLF+5iOcW52hCjvTZoKs?=
 =?us-ascii?Q?ls7M1iN+CPhwZB75DxqtHTi/8uK52T+hdksj0HFcCDLheHE8B5IqR+SZ1eei?=
 =?us-ascii?Q?GojaeRa3+e3889A6cEZhq+4Inws5z1llWmsx4eTyyRyuVtmycMBnQlRIJ6AQ?=
 =?us-ascii?Q?bXzB9ctBd/PTcvysocvGq5yR50MidHVYSPSVabT4cvVuXiU8O4jOOdskItwg?=
 =?us-ascii?Q?B/u7XP0XZiJYsNXroiHMqKbvBRu2S95aFjLgfKugYk6NLXvyt9m09t22KqsN?=
 =?us-ascii?Q?TLeid23OyZYdNnFVAJXylm0+0ygbfrChXvq3vC35XOp1naHu//erDMZXVhR7?=
 =?us-ascii?Q?dCiBz1DrvaTsR18fPRhQbF6Kcceg2VFWSEfplOgJ/hGdyM9zdWQDuweBfu38?=
 =?us-ascii?Q?kpmzFAkT02/CZTmY+636mDoJQDe+kElKMjpcPS/LX48UaTNSxPN5jTlrT9EU?=
 =?us-ascii?Q?TgJU+XSg75FBELfgjQ91NBM/UyokDvtWqmTnmMumhJmDuC3VQE0/XtcVNf6X?=
 =?us-ascii?Q?nhcX3J7/bCYEw12oT/8JbXxQakdlXQn8t0OMXbvr71qUNTX+UsqmdY/zsRey?=
 =?us-ascii?Q?h7i0ydhWKvVKoANEkWj9fA40wAouAlyMtXR8nBOvOqoWlXu8M8abE+WG0pGK?=
 =?us-ascii?Q?4FmUO1U5zin6cgNaNWlAQoM345bh6T84WF0nBrGeDQjgB7eExvKD7cWYiv1O?=
 =?us-ascii?Q?g+xAekwsFrlqye6C/iiM8OvaIWxdEM19P3resqvNB8BR2U+wl6ylubPSeIF+?=
 =?us-ascii?Q?Wy6SXUZkD6xjP+t+slBYO7HvX2SdB2Znj6k9/7U0l/yKggTKKGndLnxZhNAc?=
 =?us-ascii?Q?ocwyIEWzrAAk8CqSI9b43s80MPka1v/qJm6XmWPYbZJ6OABvBLojhEmU42/D?=
 =?us-ascii?Q?cYAJ1iAuC17ZBHH04SF+J8Yf0e2rhJ3RU+7XNJydofY4XJjQUa0wFyS4pEY8?=
 =?us-ascii?Q?BOIQlwjX/zql+ojyt1Dsl9dA9/qBFuayva0Q9XaIWHWluWN1yire6Q222ENm?=
 =?us-ascii?Q?r1dBgs9BUyfbrCHq69nHx5iYguSVPyLKwgHyGSdV+ve3eIgqZo7xGTyYk70V?=
 =?us-ascii?Q?vEzq0zS0LgDiFlYQTPmbivOwXf2ICHR0sdjQEEzjXNXRqrIFcN6MuwOdDBF8?=
 =?us-ascii?Q?QXI18XkiMc/WVDbi0fMfWNOIPpKXkutNmv7NG4kxFqF0Un4S9VQpqsaQNyvb?=
 =?us-ascii?Q?ZwPz1anZR6ctAakYPeXjVdVglrfpHUJq+91zqrzn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06300d03-0f57-4553-8bed-08da5a9116f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 12:07:23.0104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1xct5Q0oMUHf52n9WJcAjH6YOzW2FFPdJ7PSbj9WcpVygHkEZ1u+K5r32w5sEv4Q+k41c9vzjH1djtuv6fS+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4838
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


David Hildenbrand <david@redhat.com> writes:

> On 29.06.22 05:54, Alex Sierra wrote:
>> This case is used to migrate pages from device memory, back to system
>> memory. Device coherent type memory is cache coherent from device and CPU
>> point of view.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Reviewed-by: Alistair Poppple <apopple@nvidia.com>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
>
> I'm not too familiar with this code, please excuse my naive questions:
>
>> @@ -148,15 +148,21 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>  			if (is_writable_device_private_entry(entry))
>>  				mpfn |= MIGRATE_PFN_WRITE;
>>  		} else {
>> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
>> -				goto next;
>
> Why not exclude MIGRATE_VMA_SELECT_DEVICE_PRIVATE here? IIRC that would
> have happened before this change.

I might be missing something as I don't quite follow - this path is for
normal system pages so we only want to skip selecting them if
MIGRATE_VMA_SELECT_SYSTEM or MIGRATE_VMA_SELECT_DEVICE_COHERENT aren't
set.

Note that MIGRATE_VMA_SELECT_DEVICE_PRIVATE doesn't apply here because
we already know it's not a device private page by virtue of
pte_present(pte) == True.

>>  			pfn = pte_pfn(pte);
>> -			if (is_zero_pfn(pfn)) {
>> +			if (is_zero_pfn(pfn) &&
>> +			    (migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
>>  				mpfn = MIGRATE_PFN_MIGRATE;
>>  				migrate->cpages++;
>>  				goto next;
>>  			}
>>  			page = vm_normal_page(migrate->vma, addr, pte);
>> +			if (page && !is_zone_device_page(page) &&
>
> I'm wondering if that check logically belongs into patch #2.

I don't think so as it would break functionality until the below
conditionals are added - we explicitly don't want to skip
is_zone_device_page(page) == False here because that is the pages we are
trying to select.

You could add in this:

>> +			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))

But then in patch 2 we know this can never be true because we've already
checked for !MIGRATE_VMA_SELECT_SYSTEM there.

>> +				goto next;
>> +			else if (page && is_device_coherent_page(page) &&
>> +			    (!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_COHERENT) ||
>> +			     page->pgmap->owner != migrate->pgmap_owner))
>
>
> In general LGTM
