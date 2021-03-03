Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA732B8A7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 15:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF2389CD4;
	Wed,  3 Mar 2021 14:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6072F89CD4
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 14:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH9zpDEe0zrzac1zdTmIYhRviLKBiH+5E4ahO5ALG9X2zbonTKh7575440z+83dq7oMMrBfndIyqMlibdFpc6g6qc1swx3061XrkYX67eBQ41jRvIyEEwOk0sTq+1uABL68bDPW6A6VIArUgyMnaUWC09tuTzArCvt6l7udmW7jDJv81QqPvjxIOwstQrmtg1RHiKKtFujdZCkBiEesPKI3FGnhZKsrUbuVan7aHNEIu5ndOVjDVZBWoYPxMLyYTrROdyh9kcThc8m1UikYDwE2KYmmQdpI3G3jQ1cnaf0Qr0jhgZCNWgB11cCwU6hpjggApm7OLWF0Z7ByVK8x4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVDB76mkrXm4o70TR+bCmipqWe54CEn8lBETql/DsG8=;
 b=bb7J2GJMJlFbwUF4kqnOmh5X4nbTaiH6IDfmNm+D70bScGmMrS80ICVZxiUwPIoWHpj9I3DDkS1Yicre2ABFVE6O3V7uEU+V2pw3X+DM1+onPggy1BfpULyVcjfrCvluelANPZ1c5hOngXsC/j1Rs74IJ99PeH/MW8SdHtybzhJsiryIMW9lniTOogIaXkGYTDNIv1pPBIhcr5hPXjbjCT4uvD19QtYsJVUPn9pN9Ew57VVcR1eMXtOKBY95zcolFFItJdsmdaaIWEq63ththbd9D49z7UcL6sd+okhP1suy+LAp9h8RYCemMJ/1yPBsiPm07lZNu8ZoyWUnQVA+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVDB76mkrXm4o70TR+bCmipqWe54CEn8lBETql/DsG8=;
 b=b2uT9bTyAh9dy86Ins8BbBxQHxFPOr0Lo7HQQpJSQGp8d6St66/DikCEOe1ZJFI979+kRC73ItAoZ6OVA87s8DuNmn1ZQiY4k9CqRS5u2GvFknD5J7kcn6sPs4ZASEyozxWhldTIQwN3Dy8n8zWW7EUAsIQNxqkAvXdH4dIGrws=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 14:38:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 14:38:03 +0000
Subject: Re: drm/ttm: ttm_bo_release called without lock
To: Petr Mladek <pmladek@suse.com>
References: <YD+eYcMMcdlXB8PY@alley>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dfb27823-6033-f9d6-72bf-6a7e899ad1c1@amd.com>
Date: Wed, 3 Mar 2021 15:37:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YD+eYcMMcdlXB8PY@alley>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fea4:8409:66bb:aad2]
X-ClientProxiedBy: AM3PR05CA0130.eurprd05.prod.outlook.com
 (2603:10a6:207:2::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fea4:8409:66bb:aad2]
 (2a02:908:1252:fb60:fea4:8409:66bb:aad2) by
 AM3PR05CA0130.eurprd05.prod.outlook.com (2603:10a6:207:2::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 14:38:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7e354b6-d438-4298-1021-08d8de51f3c9
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB491679B24ABC3DDF339DE45C83989@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcUgsytfQ+cejWq4APBg1pd2w23ITmXARcU2KbBEjOdr+ovfdHcvgFNv/jJelV4L+5YD/ERx5DyqRRB3BsBy3fLr1LE2O6Z4ehqDTOvZvGMHEMFG50n/mr3XUvH60MQxrHtu6tNHLy6MqlSj8fInY6NlNm1x7Ttp/7hN/vcEMOS1NzxTeN+ahPRkb5zkqOgmlXxCTKUGPERP3wUgWMeGZPbIgreZQnyFhUuMuRxureUxg3ttsTsg7HcYcvbNtuf/uev4CWya5B8nzHtddfy/9H9POSXGbcyUtz4+FqwipJsUqZxEGkmHXcZOqUgyf0GIGynIbHU4GQ+D7X9VQSLxmmTq0STTkxFS6TFzT1k69w3P2Ov7EuVaDgS+Mgm2MgBm4KCYMQvZ8MtOERrSm8V6ADG/Cn45u3FHkAcEuoEG0IsBOWoaGWbFie0VmDIC8PoDBiB04t493dVle548Xh6t3Uz9iLFA0yY+/t+OJlOB89KtK3eq4NcWuD6C+J3VWwHOXqhsp2HquibeTTt8aYpzWxYSNfUCgSjerOJav8SU/X5cElgghNTnpD5LicBH0k6beNCPOQURnjAaDm8DNxWFT/wg4d4NwrvxrVD6prlKhxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(83380400001)(66946007)(8936002)(8676002)(52116002)(186003)(66476007)(66556008)(16526019)(31686004)(2906002)(6916009)(6486002)(6666004)(36756003)(2616005)(45080400002)(5660300002)(316002)(54906003)(31696002)(86362001)(4326008)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmpESGs4amNLMTFYdmRFZHd3ZjdYaDJaaWtuUXVSaGcyTlQrNkdlRExvQlc1?=
 =?utf-8?B?QWplMG1mTER4Y1VvUnJnZWRJTUNJYmIzVklVWUlwY3YrdHJtYjAyd0pzZEFt?=
 =?utf-8?B?M2tnbkRRSXkzZUdGZXVyZlFBSTliSTdrRGlaNGhwT2JHVkZneUF5Nm9MaHpj?=
 =?utf-8?B?Vm1BMkVlbmxFQ0Mvb21VZnZwUzdhMXZQanRud0h5Y0Foa1Y5anBBeTVXYTJO?=
 =?utf-8?B?MVRiRlZmeFVqcjVYNmhIbitQUUNSWHd2Q0hhOW9JdlZKcVFZR0ZRSHJZMFN3?=
 =?utf-8?B?RTBBRjRRYVBOSjlGVk9yNjZGaS8rcElpR1NBOThKd0s3VzF3VEgrUklnS0Vs?=
 =?utf-8?B?b2NnQTIxTjBoMjF6cmdzMUJ2RnpKT25QMnZEcXR4b0QxNlVmbEFFN21wOXl0?=
 =?utf-8?B?ZnRJNjNBMVdMMUJsV2JOTWdDbURUZWd3YUVCNnJhbTJlQ2ppNjRMVFVsTlcz?=
 =?utf-8?B?SlBhQkNDaWt0eTNieVBaMjRQNm82TEkxT21Yb0k2UmJLVWpNTzRpUmFNNkpW?=
 =?utf-8?B?ZERySkRXS2x2d2g1UlBUMlFReFhWWCtaVUU3VXpXVStSK0dsSTdvV1pFY3ZB?=
 =?utf-8?B?ZnREMVJrUkF3VjQ2SExOQndLeWVqTmlhdWM5UFRFRTI2M2xLamVrVDJBaURq?=
 =?utf-8?B?Y0pqdVNKeXBEL1o4WEFxQSsrSUwxSlBZMTQ1d0R3dFNneURXaUxFUnh4bjl5?=
 =?utf-8?B?K1lsYitCQm41ZUpwdzJ5dmduNzBJek1xWHk3RE1FVVlNMEdRd25KVXNEK0g1?=
 =?utf-8?B?b3VDMzd1cGtRNGdSaG1RVTBuMWIxZWFxaE1JY3I0SjFiczQyUmdlVFhGWCtj?=
 =?utf-8?B?VG5kUFZRWmpsc0R5bS9yMGVJRXc0cGE3WXBtMjYrNmVkVy9INlR0d1BkNGlV?=
 =?utf-8?B?ZEVIR3podndYYS93U2dvOVduc2R4VTZDWDN5UDhmcUp6YnYvaEVGUUowVHBl?=
 =?utf-8?B?TEVOa3Y5clZPd1V0VzVGamk1cTJGb0U5M1kwY3lQVlNrUEFmZmN0dXR1RDk0?=
 =?utf-8?B?R0xiTCtxTC9TUGpXcG9xQk03OXJqYXZLWHc4SXVNNmlha2hEai9UbWI5Q05p?=
 =?utf-8?B?UGhFZkhiWXAvbHdGMWc0dHk3Z0dJQUtkaWE2akQ5SVFMN3ZCYjNKRWM1SVda?=
 =?utf-8?B?U3h1dWZkOS9sMVlQaTVVcEtoSlJaWlREWmp5LzEwOGplczdyZUZaZ011NWdG?=
 =?utf-8?B?c2VPWndranJ0RnA3Zi82ajRzbHhENG9DcnpnaGwxNmN2NUZsVVhPeG5BV1ZW?=
 =?utf-8?B?cGRmYUVrWHlGT3ZlcTdQWWdGUVN0QWZ4Z05TNlI3cWhpcHZYR3ZmK0oxL1Ay?=
 =?utf-8?B?Vis0N3A4ZktFWlBwWExOYWZKdVlBM2VKT3NUWUpjZElQeElHT3JBaWVEYWM5?=
 =?utf-8?B?dFFNTmkyNGhnN2NCUDFWRFVDY2ZIdjJ0QmVkTUJTaytGUmFvTEFQVHJNQUE1?=
 =?utf-8?B?NFpEZVdkOFdFZEViKzdKS0dzZHVsajZIM1ZiMHF6Rjc3ZXpWbm9wN3RZTlV0?=
 =?utf-8?B?T0pvTHJBTCsxQmJsQWJQN3pMR0Z4NVlNdEM3SS94c1hpbENkSUpWd3RIYjM3?=
 =?utf-8?B?TDdKT2FDUkxDWTdwUEZ2Y0pWc3RVU1FlTU9LSFJwNWRaWWxmYTY1K1ZCcGpN?=
 =?utf-8?B?RFl5MWJ1aUIxcHBQS0lVd2t4d2Evc1RCRHFERjZYeStJWFZMd3B6U1hTWnpr?=
 =?utf-8?B?T3BSUlZxT1Z6cDNMR0ZsQXNwMGNSeUNldFEycy9JY01OamQwMkc5NWlHN29O?=
 =?utf-8?B?RzhUWWpsUHdERGhKQW92TEtKOUNjdkNMWmNYVTVBbnMvSitJRG5aT2dRbC8w?=
 =?utf-8?B?akFXVEFiYS83WlR4aWNGZzkzeHBIUldxb1pzYmVHK2NmcTUrSHdpSWM3by9U?=
 =?utf-8?Q?w2HHkx3s+XLmU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e354b6-d438-4298-1021-08d8de51f3c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 14:38:03.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7vsLAsVC2CTJlB8qsSWYC8zXiVrloaR2olbsNULlTgLS0DCi8zhhTwmDzgrQaaA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Petr,

yes that is a known bug in qxl and yes the patch you mentioned makes it 
worse.

Going to reduce the warning into a WARN_ON_ONCE().

Regards,
Christian.

Am 03.03.21 um 15:34 schrieb Petr Mladek:
> Hi,
>
> the following warning is filling my kernel log buffer
> with 5.12-rc1+ kernels:
>
> [  941.070598] WARNING: CPU: 0 PID: 11 at drivers/gpu/drm/ttm/ttm_bo.c:139 ttm_bo_move_to_lru_tail+0x1ba/0x210
> [  941.070601] Modules linked in:
> [  941.070603] CPU: 0 PID: 11 Comm: kworker/0:1 Kdump: loaded Tainted: G        W         5.12.0-rc1-default+ #81
> [  941.070605] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
> [  941.070606] Workqueue: events qxl_gc_work
> [  941.070609] RIP: 0010:ttm_bo_move_to_lru_tail+0x1ba/0x210
> [  941.070610] Code: 93 e8 02 00 00 48 89 0a e9 00 ff ff ff 48 8b 87 38 01 00 00 be ff ff ff ff 48 8d 78 70 e8 8e 7d 46 00 85 c0 0f 85 6f fe ff ff <0f> 0b 8b 93 fc 02 00 00 85 d2 0f 84 6d fe ff ff 48 89 df 5b 5d 41
> [  941.070612] RSP: 0018:ffffbddf4008fd38 EFLAGS: 00010246
> [  941.070614] RAX: 0000000000000000 RBX: ffff95ae485bac00 RCX: 0000000000000002
> [  941.070615] RDX: 0000000000000000 RSI: ffff95ae485badb0 RDI: ffff95ae40305108
> [  941.070616] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
> [  941.070617] R10: ffffbddf4008fc10 R11: ffffffffa5401580 R12: ffff95ae42a94e90
> [  941.070618] R13: ffff95ae485bae70 R14: ffff95ae485bac00 R15: ffff95ae455d1800
> [  941.070620] FS:  0000000000000000(0000) GS:ffff95aebf600000(0000) knlGS:0000000000000000
> [  941.070621] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  941.070622] CR2: 00007f8ffb2f8000 CR3: 0000000102c5e005 CR4: 0000000000370ef0
> [  941.070624] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  941.070626] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  941.070627] Call Trace:
> [  941.070630]  ttm_bo_release+0x551/0x600
> [  941.070635]  qxl_bo_unref+0x3a/0x50
> [  941.070638]  qxl_release_free_list+0x62/0xc0
> [  941.070643]  qxl_release_free+0x76/0xe0
> [  941.070646]  qxl_garbage_collect+0xd9/0x190
> [  941.080241]  process_one_work+0x2b0/0x630
> [  941.080249]  ? process_one_work+0x630/0x630
> [  941.080251]  worker_thread+0x39/0x3f0
> [  941.080255]  ? process_one_work+0x630/0x630
> [  941.080257]  kthread+0x13a/0x150
> [  941.080260]  ? kthread_create_worker_on_cpu+0x70/0x70
> [  941.080265]  ret_from_fork+0x1f/0x30
> [  941.080277] irq event stamp: 757191
> [  941.080278] hardirqs last  enabled at (757197): [<ffffffffa217431f>] vprintk_emit+0x27f/0x2c0
> [  941.080280] hardirqs last disabled at (757202): [<ffffffffa21742dc>] vprintk_emit+0x23c/0x2c0
> [  941.080281] softirqs last  enabled at (755768): [<ffffffffa300030f>] __do_softirq+0x30f/0x432
> [  941.080284] softirqs last disabled at (755763): [<ffffffffa20eb0aa>] irq_exit_rcu+0xea/0xf0
>
> My wild guess is that it might be related to the commit
> 3d1a88e1051f5d788d789 ("drm/ttm: cleanup LRU handling further").
>
> Does it ring any bell, please?
>
> Best Regards,
> Petr

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
