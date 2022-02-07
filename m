Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1314AB61C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 09:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFBD10E76A;
	Mon,  7 Feb 2022 08:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4F10E76A;
 Mon,  7 Feb 2022 08:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8GG8TD4oyJBelKLQ28tAdxty7eE+nRwfjjaFjs1o4tZPt7LI/VqMhaJUDIzVtQqpUNwFTUgHGh3hlCCnf+Ck7TVmA66/gEeECJt2SsdBUl+3QPVQjdOxpXUf6d1/pnppjRjulc20v/VrZYwEg67WGEPA+vDE+R4vhEnWxdK4sFG/t6cuN9BaMN2C6vuOMmyzP0+1uzbh1PxxtOpGIzp6sPkvzehHchFrwoY9WxJEhOkAmwDM/20t4eTI9N3OCO91KbbVgthBKJqMMWk6XU1IoljDWtJlfHBJPf0b6nu/Aod87ZZQK7D9hNDW7LwPEDzzGk2IucfBKE0uGdovzixXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU12EsFe2f/FmvfwtuaFYQIcwJMZGgI75PfUl1ZDp3Y=;
 b=MhRXt3TYUgppanpksQjkq4U9sK9yJoVLgUxE0pfxaaFZB9LFfsswXuKllrZznNCowNlh6SNwqxGlVhbqJtcEofNAmnj4aWKmvyM3foXNoup77vM8SMkgMbSljrVhwk87O1gw7P0pEJ/1+0dItppn5Spr1ttJrU/SwzHadLrsfxNCAZqm0ei0CBQTvlVP/3q9sjsJYK/H5IveITNap1/99UEHzsajBwTfGgNsPr2Fva1R7lnWZbBYLUKKLPW3aE5+PS9pfYL6Re2GrfcTNV4uPyXt9LJRB7B5Uy3AOU6rLcCjOnILPFsUy5QQLq0bOfuHLbDYALQk5PQ2166HLcJikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DU12EsFe2f/FmvfwtuaFYQIcwJMZGgI75PfUl1ZDp3Y=;
 b=sOF/TWosYpN7wViuSYStM8Y5aVVB8bFzGOM6m1rVE9zcPD4UQTGd0VxBtnAWVaZ+gAQU4fNj5TtmxCaKe8yM2rHsJro+nsT3hVCPu2ZFLiEqnIp/FAUGTYAMSOw7csX6gLK2OP4hivNscS17/IW9am8SWCRQcQevxKflZ/mXFCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BN6PR12MB1556.namprd12.prod.outlook.com (2603:10b6:405:4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 08:01:57 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e920:c950:24e1:1154]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e920:c950:24e1:1154%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 08:01:56 +0000
Message-ID: <fc165d83-bad2-2189-ec7d-2c756275d85c@amd.com>
Date: Mon, 7 Feb 2022 09:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/radeon: Avoid open coded arithmetic in memory
 allocation
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1f44de96e6a49e912111fb3b664f087328b4c2cd.1644082664.git.christophe.jaillet@wanadoo.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1f44de96e6a49e912111fb3b664f087328b4c2cd.1644082664.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0502CA0005.eurprd05.prod.outlook.com
 (2603:10a6:203:91::15) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dfdfa9e-f29e-4008-54e4-08d9ea101c1b
X-MS-TrafficTypeDiagnostic: BN6PR12MB1556:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB155650A48B009A73E7F29CE4832C9@BN6PR12MB1556.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sJbC5238VzISaTW+qIYa51zKWUnLr43fQTXEv5bPQNG8CjGEVZJUy8x+n5iaSlL3B1XF8vJJdH9XixK3pD25520WjU99O9zOA1Ff3yPaZepXNOjmCbpis3ZPdSZj1UdimWs5xUufIfVL75L697sVsQFlDT5E51pv2nhgDaGDOPoWK2hR3u1pV2k0KFD8wwgHzvZnN5ldoCkvE1JNuSjnzaYWp7bDUNAlp+UtH8y/nZt/21JS/agGk5xzLDOHs9yOX4K/yfGetLWzds66xsubFEaMNpiJzT0uGy1BSAQ6bET4Oak178SHwz3PdnbOgGMo33CTqwbmPF+Tv4UPzNMRRlHxpYSwCy5fZk9LQGmhexcVbxkDCdZSIiy1/B87A/oMwoSScTm/nQ7RTd6/BWIA+kqE5PR++b8qOFuZ+vHWa8MgnYioelaic5yE0VdYYGIDqNN233d/az2rvkqZWOgHmtWKPU2iMT0vh2avowoYF2QTpWJ33Uf20y9bsMiUruEtb7SFrqRDnOvpyxKg76vY1bg0447GExMCi4pareK1wxrd/GCgBF0OtB3uapTpEgeSVrNud3swj3Gqu80KwPzbnktmjqe6ErGniBmexGer0T7RaTTo63ptw41E9TGlwmxUVCJmaeS6yAvxjb7EFXD9yyNINuohAbuKqR5GpnhnHpx4aKp5+910F/wkNon1khi/bLgm3E0aroRHIPHVp7FpVinQWBmZftPhTFLUgwxJyOua4psciBJ5CEKi/3e6PsFb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(66476007)(38100700002)(66946007)(66556008)(66574015)(5660300002)(4326008)(83380400001)(8936002)(8676002)(36756003)(31696002)(508600001)(6512007)(6666004)(110136005)(31686004)(2906002)(2616005)(6486002)(86362001)(6506007)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZRMXhEZnNLSFphY2R2ak8xRTZuZTJWcGNMSVFnSW81WEVpMjVLZDZGbDV2?=
 =?utf-8?B?RkxyRjZDSitlM0NnYzNETUxjblJheDdqUUQrdEJKdVZ2Z2NpeThSbE94UC9k?=
 =?utf-8?B?aFdCSU1Ya3lNRGxoSml6T3VQOEpHK1I4WThiM2F6NGhsamtYWk9rcEUyalVE?=
 =?utf-8?B?Vy9sbW9JRnYyeEhVbERIdENXV1hhMk9xNEpHd0ZtKzk1TEIvc0Vpbit2Y2ZJ?=
 =?utf-8?B?MllheVJ0cDYrVHdSY05TVjJDTXMzUjM2dnNTQWFESzRXK1RNdWVTeitJRmh5?=
 =?utf-8?B?R015OU9kdENVa1gyS0tBMkdNRVpQVWE2VENJK01USnlwcm9DQXRrWXRVVWgz?=
 =?utf-8?B?N0ZuMndWKzZzcXVzSWdpS1RRZEVyYVBLeS9aN2psczNFMUozemVYQTh0RG9z?=
 =?utf-8?B?eHBmeWVJbUN3TVFTMitDV3d5YVFoY2VCTWk5UmV5R05ibFhyOFVmbk16dUp4?=
 =?utf-8?B?bnpEQ0N6NXpnMGZoSTRpUmkvSDlhL1ludkdqc0lvOVpBY21MWVZaLytySmNq?=
 =?utf-8?B?SUE0aFV2RWJVY2RoS0t5QmtwUjZJWDE0d00yaVQvTzNJWVhqb1BrZS9JbGhL?=
 =?utf-8?B?UXBndWROdnpMVFRTUjA1NzBvSGpaeXF3RU1rSmJyV1Qwd3B4VWxWNzVOTk15?=
 =?utf-8?B?TlFOcno3Um5rM3VBVzk2MjhTdnpGcVovMFAzK0FmR1RKdWpjNUI3QVFYRTNI?=
 =?utf-8?B?RUtudU1UR1JjVldla2NoS0JPQTJNSEE4OEREenIwNTJMTUJ2S1QzNjM1Tnkv?=
 =?utf-8?B?NEY0M1oxV0VERFBaNG1kRXo3dllTOHd1RktFVE9lQTFXSDRMZGh0UVd1eXpN?=
 =?utf-8?B?c2NEV2Zjdy9IamJueEtYZDJROTRMUXY5L3JlaDQ0Zk1XRmt1MVBGckhQTUk5?=
 =?utf-8?B?N2s2UlBNTTJ6REN2SEFoRmxJTE5XdHl0YmNhMHMrck9FaEZnWmNjTWxwdnJH?=
 =?utf-8?B?Y0dnUFdlVkgyMSthM0pVTUNka1VQVjRjL0Fvd2ZNbWRVbS92QjJ6eWRJc05Y?=
 =?utf-8?B?Z3JIWGdqNDV1bmVYalFQZFJNM1gxZmY2V0I3K1FHTGt6Z3R1WURYamdGVmdJ?=
 =?utf-8?B?ck1zQUtMRlVab3BwSjB3TlZKbFFhK25zUGJRa3dQUGE5eWIrbS83a0drQVlT?=
 =?utf-8?B?UlpjL2xHVEkvRGFjQjZ2TDVXdzZPL2FEUjlKRk1MSTlNTG1zRklDSlYxL25i?=
 =?utf-8?B?Q3ZqakYvTE1KY0RvTGNRcTRZcWU2T3pXWVJ2b0YxTzRjQU05eHpxdHJZL3Ry?=
 =?utf-8?B?OWtxZDI0aGR3Y1lIWitlQm84ZzFia0ZNOVpiWWYvY3J0L1ZDNGw5K1FSR01j?=
 =?utf-8?B?RGdiSm1xN3o4cDJRSmltcnlwdkpaUkFkQXVZVXE4NW1YWENRc1BtclpBczVF?=
 =?utf-8?B?NGx2TnNGZm91R0k3Qzg4RDQzcHFMNi91WkNXRVFLTll1cURrZmZzd0g3VHBy?=
 =?utf-8?B?Z29TcFVtMERRRm9LdWF1ZjJSdEowOVE5MmNuZnY0ekJuK200N3o2a0RrLzFP?=
 =?utf-8?B?RFRoWWxNY3NncElsRG5vMmtnZXdUc1E3RTZ3SFZsS1VDeXAvYnMyMGdFMDNi?=
 =?utf-8?B?aDBFdkY4VTFZTHhYK2VlcGtDN0lhc1N1LzhPelg0enprNHJkMUZMQ2xNK09P?=
 =?utf-8?B?TWpQeUIvbEp3cWx2clQ2QXV3MFliSUZpamxpTTJCZXpXM3VVM0d5NVA1TTYv?=
 =?utf-8?B?dERsVEEwMFRxTG1TMmY2bWlFZlNpcWQ2Q3dRS01EVU9xbytWWElkMGZzS29B?=
 =?utf-8?B?VnViMERXK3k2eGV4VmN0T2g5U3ptTE96NmNxK2IwdXhQaWM0Y2g5K1FsU215?=
 =?utf-8?B?Z0JJN2RTajNTMS9ML0FDWnozQnBCc2dXUVZNNGdid0N4eGE5UFk5UHVZdndp?=
 =?utf-8?B?VEVROGFhNjYyWXZQdmkreDdJKy8zaTYvd2dFQVRuRmQ1aFhnOTZGY3hPUWhR?=
 =?utf-8?B?RExEMWlEWnFSeHZWblFXVjBhNEtVdDk1SXU5aXJnNkdYQ1oxcWNVbGtGaHZn?=
 =?utf-8?B?L2xTeVJDTWVsbWdCcDN6ZFk3em90ZzRjOU9KT29KZ2VuM0lNQ1hUOWZWRDJY?=
 =?utf-8?B?M3JSdFhTaUE4ZGRGUDhmOXpLMTBENFVQU3kzbFpwemVnNXZSV0FtRko0aHAz?=
 =?utf-8?B?eS9oeE9nbyt1SnFSejRsTDZyT0ZYd1d3Yjcrc1lHaWJKWEFqNkI2RmlrdTdl?=
 =?utf-8?Q?gfBQB4yYWyHqkQDRIoj9G4k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfdfa9e-f29e-4008-54e4-08d9ea101c1b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:01:56.5002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geZpJg64laR+YJB+wxmvv7k3T+UeAgvxj0pk9GlLpYXPrc3KAfqF+l6YZQbFZLm9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1556
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.02.22 um 18:38 schrieb Christophe JAILLET:
> kmalloc_array()/kcalloc() should be used to avoid potential overflow when
> a multiplication is needed to compute the size of the requested memory.
>
> So turn a kzalloc()+explicit size computation into an equivalent kcalloc().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
> index 28c4413f4dc8..7b9cc7a9f42f 100644
> --- a/drivers/gpu/drm/radeon/radeon_atombios.c
> +++ b/drivers/gpu/drm/radeon/radeon_atombios.c
> @@ -897,13 +897,13 @@ bool radeon_get_atom_connector_info_from_supported_devices_table(struct
>   	union atom_supported_devices *supported_devices;
>   	int i, j, max_device;
>   	struct bios_connector *bios_connectors;
> -	size_t bc_size = sizeof(*bios_connectors) * ATOM_MAX_SUPPORTED_DEVICE;
>   	struct radeon_router router;
>   
>   	router.ddc_valid = false;
>   	router.cd_valid = false;
>   
> -	bios_connectors = kzalloc(bc_size, GFP_KERNEL);
> +	bios_connectors = kcalloc(ATOM_MAX_SUPPORTED_DEVICE,
> +				  sizeof(*bios_connectors), GFP_KERNEL);
>   	if (!bios_connectors)
>   		return false;
>   

