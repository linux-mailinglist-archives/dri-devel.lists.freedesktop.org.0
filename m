Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EA36CD275
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FE310E4C1;
	Wed, 29 Mar 2023 07:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2698910E4C1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 07:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLjDCHB8GOpVmUo4YTKq8WKOnOT0+R1/UIFkN87+SB+zN6Xki7eqCkhB/78Qc5uAfMi/p3ucV7Ff+4oWktXxI/bxB+Kd/h2DQ5+3T823xr4nNkBUOPHHMM3UlhODhT7Yllfkaz5G+uykWzoPD3hKVZMh/unh3PFGDihUA/cVKSXLS5x9iFs6zbzPq/qntNUOJk3vAiG9tezVbZdB+iuSx+sorTz7NGTRVGZXkOMVvRkbX86K3QPgF37vF/+wjL4Ng/GRcdnd/AyXCv1UBEKasOlbccw72cLliPF5SVKZD2hwOvHYFOh+AXDOc8EZDijHoTUE2/AmZkgOLQqa6ZMzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UhnNXwf9fUrtQPAfLEwCxY7dpb1KIAQqB3KNNN+Pyg=;
 b=lq8TTIToyoRAzcH45TS8RPB74/LAR/DmM5xakm501OzFrYMILlPz7KUdP1dDaF79mOSRg8aQmpznRNgVR8XhX1j4G6s6uKXZELz1v3moiZNvbx72pBGaO/S7h1SLLfhz7Eh9g8HJX5fwUzL9KjHMFhiyMGLdqrw/Bwoa08bEmz983/pQf7/KDZwVWeiAtiYL5lYCvH1mOUlSPVKvj55tYGF6ddhC6uVGlbQjuOpop8FDDe0+ggfSbZ6AnlGqPaLOIAN5YXZs02SlWtZfWDteaZu3PiFiDk659mFecOFDC4JcczeAj7lP0VZYYebXcJ8feZE/tuwzadrQaoawRUtzEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UhnNXwf9fUrtQPAfLEwCxY7dpb1KIAQqB3KNNN+Pyg=;
 b=bgC57/ooUFh+PAxQaZog46cB0wdVSejkcUf0154x5QZ7aCoxjKkzJFWE5AHkt64w9OuX64CfagaUhoZ1ALoE3cRJuF4udd+Bk0hJdVyORMV5yUHDSrsJak86hnycQyTrYaPZJ5By+FrJ9zJGkKwXDn85mXOgHm+upbp+mkLel/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB8753.namprd12.prod.outlook.com (2603:10b6:610:178::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 07:05:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 07:05:00 +0000
Message-ID: <91873ac5-a15d-a405-c2ee-24674e17cbd3@amd.com>
Date: Wed, 29 Mar 2023 09:04:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm: buddy_allocator: Fix buddy allocator init on
 32-bit systems
Content-Language: en-US
To: David Gow <davidgow@google.com>, =?UTF-8?Q?Lu=c3=ads_Mendes?=
 <luis.p.mendes@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230329065532.2122295-1-davidgow@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230329065532.2122295-1-davidgow@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc424d6-0c79-4098-4f4c-08db3023e995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jzWK4XYbkGqkGPAcy+fda2ACqjkSyTAHZ38gSKiCpzzWODsvg+kRcAMwgJ9z4EJF6TNWjxC/nX04uKF62hWFJqtQwGBw03up5812NdgLJHz6d155i0kaeA3IaHu78jLzYud4SAE/TeXUGYe4CKAh/Zms7RK5vVb2oS7HJHVKuy5uXMqeyFUL98bEFasfAqpizHaSZyZp7usEXpEmGbFFRsPNz4Y0418l9vyHQulZvQ15LVJ6PodO5HLpOLjRMtODVwEMIwdIomnG1zswI3gTdsF/8uTc6/GqvhVvziL+vhPfYvtB3n6ymVAXHgJ6XNlNGQQsByN3xqTC0t8p1CblaxVLzPrNKDxgO7epPE+YedVvwhKheNi8GxYxiz4arfsnhEKIa7jymbwldsZuoptde5kNN2oUKE1W+Y8ikZ4Wb+jyupTbumfqe8MKkZHUaOFPS/EmF+7o3iiTKTfNic2B2Z2jPX9xJWBcUUVPZAnsxiEdCT1U5oxKkPcnu02qyfXjAVsfHQFqH9WTl+Dbg6XiDXj13s5OZjKnTPEc//tHrNxycSCFNzIXI8MeGbcbBUfsSQl+bObyN9WOKTEMwrnX7DfAfbVAwiWrtZH2nRyYts1K1OSKX3yPkIhhfiekTWdo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(6666004)(6506007)(6512007)(6486002)(966005)(31686004)(110136005)(478600001)(316002)(186003)(66574015)(66476007)(8676002)(66556008)(66946007)(2616005)(83380400001)(41300700001)(8936002)(4326008)(7416002)(5660300002)(2906002)(38100700002)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWFYUy9qMlNDajJOWjlvZmxOS0NKNWZaZ1QrZmw0azcyREZNeVNORWNIazlN?=
 =?utf-8?B?NkJkRUFpWUR4RVJ4MThxQnF0UEY5R1RGSEZtV0FjT0JOQmhlRG5ReEM3TDRZ?=
 =?utf-8?B?N2FzWjJyc3lSMzdwNEpoQkVzY095QjFqUlEyZkg1K1lUcTJiNU5RZDVXbEY4?=
 =?utf-8?B?MjBzdi81ZFdDa2JHVHcrbDRvdE1HU0JTS3NQR0haT0w2OXFiRmVabysrQU8v?=
 =?utf-8?B?eERuTnlVZ0k3ajRuNzFsUkhHK3hCbU1ZcS8wTUZWZ1RUWmxBMVdWTmJJSms1?=
 =?utf-8?B?WWlZRGpubks5cHBUN3VCc1VTSkdOS3hNbEhZdnhkSzhKYjRYN3hwNzgvbTFo?=
 =?utf-8?B?ajdhZVpLNGYvWUU0czU2NjI0YnZKa3B4RmFtK0pCWnZDWUxneUNDTXM0dW5v?=
 =?utf-8?B?TnhrS0FOOU1LamU5WVhNNmp6T2prTEM1SExpbU1BM1NqNEFoMGVPN2YvSEp4?=
 =?utf-8?B?ZTZicVJDOE5JdGk5N08yZDZCeFp1R0p1OWlsMXBUMGZUTFF2QWx6RkNPd2lN?=
 =?utf-8?B?dVM3TmRuQkNCQ2VSNkhFK0I5V3VibmZvR2o1cWlsc0ZQdXdPR3huVG1EQVh1?=
 =?utf-8?B?WGRYMnA4MUlTU3YyMmticmkvZWlTbEFJSXlhWHZNc0RFTHhYTGVIRDVpMDRX?=
 =?utf-8?B?dW1QM21Yc2p2QzZibWNtcFNOOG5jZm5HRlFKWGd2WGRPNlF3YUpuaWRLcXN3?=
 =?utf-8?B?a0ZGS0V5dG4wMCtRcnNmTDZuRllXR215Z0l2TUE4TVpEdEdiZk9XbTJtMitz?=
 =?utf-8?B?UjBKbkZhdjNpOHZiWFdHL3FUZUhXR1pmQVRuRXZiSmgzdzFhcU9lYlZocUEz?=
 =?utf-8?B?c3h3c3M4Zi9NL0lMTUxITXpZWnpDWkxJUDdTOFFMUjN3V3diZ2Rpc1ROMDVV?=
 =?utf-8?B?Y2VnTlBJcG9PbndWMHhBaUlYV2NpalpFMGZ4SFJBWUdiVGFOTlpQaU5lK1NS?=
 =?utf-8?B?L3hsaVNCWnZEdWxndWFsVmt4bXo2WEtxVnl6enhFcDl4UWJNN1lUdlhYaTBk?=
 =?utf-8?B?YzQ3ZHFDcVNYaHMra3NYTmxUVWlBR2RCOWFiQkc5OUw4UzJZdlhXMitzTlpU?=
 =?utf-8?B?RXhpemtNbFN0ZXp4b2Z3K1krLzRDbG9lVlNVVzRzYkt5djRiMEd2R1BRVnNQ?=
 =?utf-8?B?bitRenpyQ3lhaDFDZnk0c2VlYUxnbzRXcnZxS0cwc2pGZEwycVkxSVlYRk1t?=
 =?utf-8?B?NGZaNlZOeWNUZEN3VWhCckJac1pidUNmQ2p3aEVIRkxjVmNCTGlPbE51TVEr?=
 =?utf-8?B?VEx1R01oTU83Z1RiVjFSa0xhRW0rcEN2eTBOeXo3QVU3TGdsRVN5cElrTnNW?=
 =?utf-8?B?Y09xOTZzY0lqM0ljbTAzVXVWRm8vZk5PSXRPTVRkT2J4TGVtSE5wbEtUU254?=
 =?utf-8?B?a1JCcmFjRWZDcGc0cWpXRCtHNEtoY1hPaXVzSWRmdUhnU0V6QUZBTlVjTnRB?=
 =?utf-8?B?Yk9vcDFydFNkbFFIaGdMbU9XdlZNTW0zaElVeHRCWUdnK0Q5RDVyTjJhNzRX?=
 =?utf-8?B?ekZnbWxqWEt0UEQxRWYyYW90NmFuQWZTWWlFUVMwdjNRdkViWU9nT1JnV3BU?=
 =?utf-8?B?Z2lWWkl0N1FsZkYya0JMbWwwaGFrTFVHTTB1OER4VFV0azJXd1FYaUtiY0Vm?=
 =?utf-8?B?elFVVlduY1JXcU80WXpBYVdrVjlLaTRlYnpiak51WlV0Z3NSZ1Z5K1FXeGFq?=
 =?utf-8?B?RUxRTzFUY2lmWTluWVIxQkk3Nk9iczRVaS90V3FSVkYzd3RzTHVpZU9EdXFs?=
 =?utf-8?B?S2p2TjJQbS9icXJxN0FzUVVTcm1ZWHpWR3d2QkpHYzc3bWozcDdPMWRpdHNn?=
 =?utf-8?B?djZvaXNla3FZVHB4RENYc1EySkttOENHa2dMRFZLSzZrdTdJWnI0ZEYzNnJM?=
 =?utf-8?B?cWorY2lwNm1LYThUMFI0ZDhrUWNQRUx0MnI3eSthZkU5bzRxeU01T1FzZk1u?=
 =?utf-8?B?bW5lWXJPbzM2VVJROWZZaUt0TUp3YmltOVN0SmtHNGZrU0dTUjAyVEllejhv?=
 =?utf-8?B?aXlzeHd1VU9wcHVtSFFpZU5hSFpuVTJiYXEvdDVmUWRCK3VHQjhsdUtPWU9i?=
 =?utf-8?B?Nll4Qy8wbXREbkxRczNwanFmQVdOdUVYeEpFTHJBb2hlMzk3OEVlM3Y4dmFx?=
 =?utf-8?B?a0dPc1prbEhwa2xHQWQraGlEZmd3Y21rUUw4VTV6Tk5aZSt3Z3ExWFdXZTlZ?=
 =?utf-8?Q?Ayh7rhnhVf6yWHkoHh+f2SVzRbajjfwNe825klzwcsq0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc424d6-0c79-4098-4f4c-08db3023e995
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:05:00.6023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQsJHHfZjcQjbqEDj9dKrd9cW5ZXqdhpiMwl6lVtVqbbkzVERl8HPzGT76XmdHiK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8753
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.03.23 um 08:55 schrieb David Gow:
> The drm buddy allocator tests were broken on 32-bit systems, as
> rounddown_pow_of_two() takes a long, and the buddy allocator handles
> 64-bit sizes even on 32-bit systems.
>
> This can be reproduced with the drm_buddy_allocator KUnit tests on i386:
> 	./tools/testing/kunit/kunit.py run --arch i386 \
> 	--kunitconfig ./drivers/gpu/drm/tests drm_buddy
>
> (It results in kernel BUG_ON() when too many blocks are created, due to
> the block size being too small.)
>
> This was independently uncovered (and fixed) by Luís Mendes, whose patch
> added a new u64 variant of rounddown_pow_of_two(). This version instead
> recalculates the size based on the order.
>
> Reported-by: Luís Mendes <luis.p.mendes@gmail.com>
> Link: https://lore.kernel.org/lkml/CAEzXK1oghXAB_KpKpm=-CviDQbNaH0qfgYTSSjZgvvyj4U78AA@mail.gmail.com/T/
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Christian König <christian.koenig@amd.com> for the series.

> ---
>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 3d1f50f481cf..7098f125b54a 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -146,8 +146,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>   		unsigned int order;
>   		u64 root_size;
>   
> -		root_size = rounddown_pow_of_two(size);
> -		order = ilog2(root_size) - ilog2(chunk_size);
> +		order = ilog2(size) - ilog2(chunk_size);
> +		root_size = chunk_size << order;
>   
>   		root = drm_block_alloc(mm, NULL, order, offset);
>   		if (!root)

