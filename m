Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48482F0DE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 15:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00410E5DD;
	Tue, 16 Jan 2024 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153D010E5E7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 14:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRa6RHBX6Zk1fJl19ayIeTyUwv/sCPjHdyYd0mVXH9dpiUQBWpUh6C1oAYZlS60GuMSgbffSZQ/i21YyR75iieQfD1JtS0UPfCEt7ej6Tg2sk5Ll8ISbZWW9L9a4SsQTzMWs5KPs2SiFVnXMMEUDqaBZesP+kZ0o0rzzxDY5F8JRyhwVZVif3njytAYxhDwB6F0b3EP5USzw7FkJPz0YqZ6a7n9WaQqgoXFwAj/ovDQMUOKusSGPFEVPL8fKcALzLK6AB1huFgDMJOkH03B1jukz0M24Czaa49Xhal+8XnKW/fKzVZGHywGaEao5kgS5KsFKlyS1oS/2GwYn8slNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO/XI+ywoZLqWgX0steGqqztKtLBW9YounEJcbbkPeU=;
 b=ZqWS2G4+YDqoqC0JLicVlXDFjPaVmu8Wt3aBVLW0yk0M9FeawYRIgWc5CpZ1YfHqkDgzYOFCDo3YxiT3fqaOeUj2FQv5vo/fJdYDxUFKqH8781hhyjh9/ikTF8KOpHg69kmac7HNlTxBoX6FdyXZlBhxZiK/9rTWVCc28kUwSH3VMEZvDlpADfSFfGIuA8Z2KNonlGBqSI2tKBOaiUEkHc37mZ37rUldIawCRLo9e8otqTY9/TUwoD6Cpo3PNiHasWyXxH+u7urwmz11lg10cU86uS+BcA73HUTFtVMkZtThtiXqhNNYijPtqmbHM8xPdiM3EUDJE5gx0SnsYW8Msw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO/XI+ywoZLqWgX0steGqqztKtLBW9YounEJcbbkPeU=;
 b=jmb/czMJdnprux4H7UpHIDH7Z/caHO9+y9aVsDFekfUlOlx0TDeGBQt3V7skWGtxF/834yb6uXbuhj77DpitHo2+bd5j+AR1l/jqxPpsDbl1C1w9RQnL8ORn1rpQMxRG0NJlvOby4FyO7nt1kfhUmJQxzJQmBrF3d0+kvG8mo7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4903.namprd12.prod.outlook.com (2603:10b6:a03:1d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Tue, 16 Jan
 2024 14:52:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.020; Tue, 16 Jan 2024
 14:52:23 +0000
Message-ID: <5012eab1-3aaa-4559-b410-0972e0a18b7c@amd.com>
Date: Tue, 16 Jan 2024 15:52:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/ttm: allocate dummy_read_page without DMA32 on
 fail
Content-Language: en-US
To: Yangyu Chen <cyy@cyyself.name>, dri-devel@lists.freedesktop.org
References: <tencent_40DF99E09A3681E339EE570C430878232106@qq.com>
 <tencent_7D66A3085F83608576A8E309EE714C5CC806@qq.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <tencent_7D66A3085F83608576A8E309EE714C5CC806@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 8148f783-b8bd-4c45-ada2-08dc16a2bf98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWBfcQ8jP6TNGNAfi1tM2LvkF3cPn3rt2ystPJ1rQxTR2EH6eII2suHUufDlMwPvA2/dDp4Wn3fMNDrk95Rk6jQ4lIqp1NH6PpzXTvPRxK16Ynl68wpV2E9vIblqiD7iDh91TgMS3ZHqYZyL0wgHi6oRGTSm3QNWyXGBAGWEenAP5ilBXzJMII3hCK5NJAnCd5BSe7mcSVYP9I7YrwHP80iIIluGJatCEK8ujwo+CK8a+HHmrGK4C7lFARmY9uvJk7/ES55qj0bmCuUdFtY2HZcgHl+HUF+9mECl18IHvzwUDW5KU5IMZBbqhJKvVMYO7fDcU0QIunFLA+uzRZ9U3nNEAVhzJOXDO+7bQp4Rzlo+SPXsKGZVtu8CFTkeLGhwoU4ZdCctIkVha1CD4qUeKDow3IpgvIgrU2ogSERbIpn3zGYdV1NMFp1dCEbmW1AsAYqaZ5vMgbXPW0meGLNU8oUf0ZxJsls3YMtFX7SH9LVzep0ipgRDGio7c5SEDuPxXJN3lG2QbJZ+uf8aiXzuadvf13urpJjXDBedcTulRkJiu556i6GGb60XQ9tLfY/UPQjquOIT472xZeY+sbVji1g0BCskuv6MtIkE2lsv5FH7WaHUbMvzCeOiJJ7dhBM5JxVB+TiwpA3UIqxSKVYMJhlFkBMh59jJbKPpVhDxN5ZY9cQrON80IS/xDCXQ1WgS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(2906002)(26005)(478600001)(38100700002)(6506007)(2616005)(7416002)(6486002)(5660300002)(41300700001)(6512007)(83380400001)(6666004)(31696002)(86362001)(36756003)(31686004)(8676002)(8936002)(66476007)(66556008)(4326008)(66946007)(54906003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0NlNVJXc29nZlFyNGNvRUwwYnhrVVFHQUNpSDdWQmJ5Um9ab3dZb2FKcnkx?=
 =?utf-8?B?ZDRXaVZxSk5Ub0FERHNWUEt1OVpQMkRkN09NN21nRUlQSlI4UzVhZkY2SEtT?=
 =?utf-8?B?V1BRamxZOEFxUmFnWVFCVTBhYkVJMUpNcGZuak5XTFNlQ3JFazRaMUIrVnJi?=
 =?utf-8?B?QmdSVXNPZm5PQ3pWOXFzbmJPdHB6eXl1NW9Hc0pFc3NhRTFWSFZCZE82TzF2?=
 =?utf-8?B?TnVFNDhZYkJiUys1OHczanZOcTJjS0RjTDBmY3phVVNZRC96VFZYMXdHUGVq?=
 =?utf-8?B?b0pwNyt1bXdGVVNtb21PSnFjbFlkNllKcURXNnNpZ05Ea2p3YklmQmpPN1VY?=
 =?utf-8?B?R2hYazl1ZWJHbTl0d091R1dLNW92alVTcmVjK3pQRzNLRlZHbXFYdEs4VHVp?=
 =?utf-8?B?L2xYOXJBTE1iU0llSzdZVjF3d3I5eSt5VUJxbUJOOTJ6WHkxVFZiTldkWXZt?=
 =?utf-8?B?VEtLNEpFRzRTTVF0ajk1OTA3VDJ0c0hVZ2pjOXJUV2ozNlRmSjFZdmpDbkNo?=
 =?utf-8?B?ZUt6OEhHZjJwRVNDWGNnZFRFSzNNNDZTN2cvYUFibnRWRUlHNXQyT0s4RWdo?=
 =?utf-8?B?OTBTMGlrdUlVSVBxWWVqdWI5cUxGZVlwZ2U5ZGpnTHJwa2RDb0ZkS3JzSUNE?=
 =?utf-8?B?b0F2bGFZYnpOeEtuWTVZZEhFQ1BIclhsazdXNlF5M2NWdW5LQ2d5UXVZRm9t?=
 =?utf-8?B?WUhlQWdnTVEycm5RYkZDRlNraS9QblVJZVBTT3Rra1VjYlV6UTdRemVNMWxK?=
 =?utf-8?B?S25oZ1hrOXl1Mm9qZUNmVGtNd1V6WU52TW5MMUEzQXZFQTN5TWwvd0lzRm11?=
 =?utf-8?B?V016TG5tR05QSUlzSG5sVHB1L1dxOUduSWJBZjhlNlFxY0xVTnh5WHp1eFlN?=
 =?utf-8?B?MkdEWHVTQTM1Z1NlbEZIZTE3VHp3YjZuNDZQRUlyYzh0ekJqMTF6VENubjlj?=
 =?utf-8?B?aUNKSDNjUlNwOG9sbWR4YXhKZ1dMdW9sT3RVZG1ET2xCYlVpcjhxYWpKbzdk?=
 =?utf-8?B?MDZaR0M5bmFFOUJsWWZXNDBQeHhDQVpOUWtFY0JsUTNvcTNic3lXeFpIanh0?=
 =?utf-8?B?RzdZd0JoYWZFZ01xOXNPcEtWeFJRMWN2TE93dERZRTNpeVVpVjZralBMTDI0?=
 =?utf-8?B?UjlJV3RDZWUrY3p5K1daRlNBS0EvWWtqRXRFME9XVVRGQlZoQm9yRjhDUThU?=
 =?utf-8?B?SkxQdXNrZjVBSUxRNmk2cGo4dmo5VEgxRDhOT244UmpBUG9YdDE2RHBsRmZM?=
 =?utf-8?B?TUdHUzNJdGxiN3lpaURQQllNSEZROFNzMmlSVlV5L2IwVEpBb1F4ODBOc1ZV?=
 =?utf-8?B?bGFaZnl1Nld5N1Jpcldobklkdy9pVUlPRTdweFBPSE85emZJQUZHMFkzZmlH?=
 =?utf-8?B?U1BTbW1aZS9Xa1Rkb0IzR1kwVm5sb25UZDBndEkwcjZvMEZQa2dmUXdrcXJv?=
 =?utf-8?B?bk0vNjBSK1ZjNFU0ZlZ2SU9XUVlLS0JUblhvc2R2ZUJ6MlgzL0hxcGZzcURV?=
 =?utf-8?B?NDBZYkorYnQzdWZVQTlqQUNIaFhoMUFXa0gzMFRZSHQzMGVmK2hFczB6bCt6?=
 =?utf-8?B?dGJ6MnVTMHlWaXVaZ2d1MjJsNjFIRDlsRWs5TlRBdnAyRUNoNnlFNUptQnFX?=
 =?utf-8?B?NE1VbnFreGdQbldTSGNFWHRueEJSNWszd052YlBUUWMyQVhhU21xbVNMdjZU?=
 =?utf-8?B?L3ZBMUwvQnc4anRzZVVTcmNGUzhyUUhWb2NLUXZ0WDRvVlpLRXJ1cEJHS0tk?=
 =?utf-8?B?ODMyaGxqR0l2ZDNmS1l4Z1YyWGltOWJDT2xZWm40MmcxWmViNm95aTA5V0VM?=
 =?utf-8?B?UzlYZyt5SEdOcHF3T1oxdForZlhNRFQ3Rm13VTlQdmxYUWFxLzI4NEI3ZFNF?=
 =?utf-8?B?L3BxZkw5cU1vUUFMKzQyS2x3eW42bm9xV2U3L01EclNDeEZCM0ttOXZPNXhP?=
 =?utf-8?B?ZmsvcnNHWWI1YnM4UVdIZEFBYVB3TytSb3JkeWhQTDV5NVZYREh0NThwMnVq?=
 =?utf-8?B?ZHZrdTdJOVNJcysxQkk2UmxoNUtVQ0cwOUNrRzZ2b2hjS1JqRWd5R1hXbEk2?=
 =?utf-8?B?R0NSckl0NzJveDNaZ1VrUW5Kb1hJNnZLUmlac285VTZKajd0cEZ4SzVGYmRU?=
 =?utf-8?Q?AAPJlHYC460E4EXZQDLhAi3K2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8148f783-b8bd-4c45-ada2-08dc16a2bf98
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 14:52:23.6302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PiESttYz2O//U9Opvmnf5AEWak0B/xjeAixPj1ACTxdM/eN7QhyW2EyrKwG5P9q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4903
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jiuyang Liu <liu@jiuyang.me>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Huang Rui <ray.huang@amd.com>, Icenowy Zheng <uwu@icenowy.me>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.01.24 um 14:02 schrieb Yangyu Chen:
> Some platforms may not have any memory in ZONE_DMA32 and use IOMMU to allow
> 32-bit-DMA-only device to work. Forcing GFP_DMA32 on dummy_read_page will
> fail on such platforms. Retry after fail will get this works on such
> platforms.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index d48b39132b32..a07d9ea919b6 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -98,8 +98,13 @@ static int ttm_global_init(void)
>   	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);

Please add  __GFP_NOWARN here to avoid the backtrace and warning on 
allocation failure.

>   
>   	if (unlikely(glob->dummy_read_page == NULL)) {
> -		ret = -ENOMEM;
> -		goto out;
> +		/* Retry without GFP_DMA32 */

Well that is obvious, you need to describe why you retry without GFP_DMA32.

Something like /* Retry without GFP_DMA32 for platforms without 
ZONE_DMA32 */, and probably better placed above the "if".

> +		glob->dummy_read_page = alloc_page(__GFP_ZERO);
> +		if (unlikely(glob->dummy_read_page == NULL)) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		pr_warn("Failed to allocate dummy_read_page with GFP_DMA32, some old graphics card only has 32bit DMA may not work properly.\n");

Well maybe make that a bit shorter, something like "Using GFP_DMA32 
fallback for the dummy page".

Regards,
Christian.

>   	}
>   
>   	INIT_LIST_HEAD(&glob->device_list);

