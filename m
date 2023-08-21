Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713378264C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134F110E20B;
	Mon, 21 Aug 2023 09:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9446810E20B;
 Mon, 21 Aug 2023 09:31:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAnpSfLG/A0ToPjMZDebV2DchvAKO0vDeacdIf8ITk2uuEOwk4fp0f7xkAccnAcObcVahfvlAQlOIdejzvErnyPJXw/NSSIK6/1EfAzB8cJsBtdKUE7SOE9ubQKko6AWzd1q/WoN6AzMccwlpdhGJUvUlGNiyWaq3uDZym96lvp8OmGUVZdGOMEorZOrcY9xelO9ZSx5MAmLNUkUs1WjmeF+z5xWlD47WfhuR76NWrx0LyWZ1eCSA5etPpYNINSPMAhnSCSXYuQpjdWCd49TTBZYs0j3KFih/iUHL+zH/MMVU5DtaSL3zlHPZsnxwUC1+9lcg0AVZILI6eM92x4qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qlMS3bJwUmRo7FZMq2rcu7kqVYDlv4N2H03/yQqOKc=;
 b=a3zRMeb/UNoyuFYGVMZjnkLuEEf87P3D4YU6Pt2IRzVhr73spIxNrIAaG9QNLXZlF8GPXCoeDRo0yJZan9E37s/XJZ7PDi46jlHGp05H6bJ8IYCXWwKMK5dOo2A4POvgOOtEIwxNXNexilXQphc5at/5X4mU7FidJDvi5uRW9QywUuYpLEW7AbsYzk3S2d9RuLRvWQG5BE2kf9LxqWLDpxJkSuKzIxRglnfHkEvbQmX29tej5Qk34chdyDCdQ4nY2dlHjA3rZQ92g5R6j8FOYd4Q/pcWTRaOMeyhaikI+FHKsEKW3wt2DHbkNzg8Hgp1DP2OCTM1g5Ve8g5c/hgvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qlMS3bJwUmRo7FZMq2rcu7kqVYDlv4N2H03/yQqOKc=;
 b=sPx99ehHYc0RlRxh/H7JhbFw8WYlrAxtroPx2eabeJrzIPr49JxoaOt+tWkCh1q5VPCpzA9Am3AbE12qDrwNdg3XX9cImrkl4Xyil/QBhVUw36Z9syWn2n2FsMWgIP612ppGJTftgUWBwYuk4hUuRknapr4/zC8bUyPB/RqYg1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 09:31:37 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:31:37 +0000
Message-ID: <2a4448cb-ac01-71fc-9335-68acdded0a78@amd.com>
Date: Mon, 21 Aug 2023 11:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/amdgpu: Avoid possible buffer overflow
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230821073727.225341-1-suhui@nfschina.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230821073727.225341-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a755da-5927-4315-9151-08dba2296ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gap3PMUf5RhOGMqqWto5yL+Qk7I7EmEHAxR7sjcV7kmpWoGWsEar4D/6YbLc7WmQ73RTXSN6rv+yqTNpmzZc2U+xkBiVOEtC3YgMFJfdbBA0spkRgO15DpgnCvPZ2E0QJTx06LqF7gt7mmigO3m6/M+kLjgfjOVJcO3YsHGCseQKSUNkbTB3h9BiE77Fgfk7ye5U1zBQ1QUAuHi8naNlDqvX13+4uyateAQu3Grzofcd1HihAXHHKmLeEUbxUfbAXJyMzd6hk/8nu5BfSyUdqMKKgtnb7h+cWruwxUaz0SJ/pmy+J6Bbn5sqA+/8qWhTgCTFkTb+dX3rI1+HORla5SQtnSJVM8gw5HQgsOalSqnOsER8V98ehf/zkRw+kQQVrgBqhbfEj1+zC+h2BQJV/ZcIGu6YKqFFZgS2m50xukNQc5PDWby+TvPW3DRQsxNakMiiIE16pOhGh3orA7UpXXcGPSi+FrhyD82fIJk2YXC6V8RIFRhd9ivSuuaMf1QS6ipYZ6kqti/ILrXd2c9BSyTH6vBUW9h4Q3FZCnv7TtT0uhGPLgMXNlY4eR/4Kwe3MeXiZe1uoZtZkT/wAFITv2+w4xItATcB/5I9aqYIqswd3z+zLfVDMojpl7K3XlLZi3HUYaWD5Q2weuUtyX1j1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(2906002)(83380400001)(38100700002)(6506007)(6486002)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(478600001)(6666004)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0h3L2RYeVhvNy9JUEZST3ZZK2V1T2l4NVJBRGhONm16OUhwUTJ3YUp3QjN2?=
 =?utf-8?B?OWE4WC9WcDAwakpFWldjcDlHTkZqRTBPZmlBWHBPaGJOeldtN3AyTVZ4R2tm?=
 =?utf-8?B?WGsrSzRlM0NVN0ZGMDJsa0ZrUU1oclRZRXdnZnF0NmRYRm1ucGt1dlNkcklX?=
 =?utf-8?B?OE0zZEFCMWVCMkJpV0piaGxjemJSNFR2UmZCS0F3cmtmSSsyaEFDb3ZPNzRL?=
 =?utf-8?B?dm1tWGZBcUxaNWd2N0l2QVFjMmIzSWpySTlLUm84cnBFMExaV0psSEhPYzN3?=
 =?utf-8?B?ZU5QRkgvQWl4OUozNnV0Y1BRMktvSzZqclFGSmk5cUZMYVUrb0RoODN0ZUVk?=
 =?utf-8?B?aHYzNWNxN1RFUmQwYmNhdmlZR0ZRVkoxSE9SbEp0cnRLNUdTcEEvOXZiSjVo?=
 =?utf-8?B?ZHpobXJFV3RPbENiZzNQd3o0UkRsWlBqYVBxTzJUWnVnNTNUZFdxVTdwSTFU?=
 =?utf-8?B?L21IMElXREVLclhMZElDQk1sSkN4V2xJeVlQWG9zaWcwQUFNOW9uOUVObW9X?=
 =?utf-8?B?UnBSeXRFM0JBMW8zcDRzcE1Udys5WjBmSjdGa09aNEE0MldKT0xvMzN3d01z?=
 =?utf-8?B?Uml4ejVIeWtjVFJCcGtqWXhSY0dERWdRd1ozNU5vY3pkbWZ2c2NIRlF3VnZK?=
 =?utf-8?B?MEtSUFdhQUVCUDlNbmEyQk1zOHMvc3owckxPRWR3dWJJRFR1VjI1c1RmYzZO?=
 =?utf-8?B?bGxkOWFVMG1lQlJmbDRoRWd1eGJHUmtrMDliSzZYa3ZWRXNJSm52dGc3S1pm?=
 =?utf-8?B?NnpvU2x4OTBsWUp6azQ1S3phOWI5VUo5L09BdWxNL2VreXRnYmt5N3N0enZM?=
 =?utf-8?B?UENxWFlBNHZLeDkwV1dhekI5b0RiMWkvWnEvZEVFVkt4RUtZTTV1QUNxQ1I3?=
 =?utf-8?B?SW1NRG8zbGFlNThOSk44dWtMS1JpalFVT21jbTNlN2ZMci8yV0s0QkVKeVJN?=
 =?utf-8?B?MUozWkt4VFB1S0J5eFVsb1FaL2pDWktTWkVheVNETmZBS3FzbUVscjRIOENr?=
 =?utf-8?B?YUtoeXFWaHpuK2xJUXU3NEIycWh2aEIwcVhqU3lpdlRRTEhnYXc4SThXV0da?=
 =?utf-8?B?WUFMVjFJOTNhcUNQb0NJNnFuM3c0eHBwNzlrUE9acVUrS1NXWVQ5a28vRmpW?=
 =?utf-8?B?U1BjY2hkWjgxWnR0YkNqa3lFaE1qcThWWXpESWpQR1VPS0p3WkpySWFQeW9z?=
 =?utf-8?B?cTBETE5yWUlmdERpV2ZmTkw5dnN0UE44bE9NTkJCSm05bEVxd0pUS3R5dXkx?=
 =?utf-8?B?Y2pteDJmbjcvTjFoLzBuSlJHckpVeGFWcm5Cb0kwMUsvNDBnajdKRnZ0MklI?=
 =?utf-8?B?OERHL0ZnaEVLeXpiakVocGVTSCtUUFNEWU02WWI3dUYrZmszcjJ5aUV1M3Aw?=
 =?utf-8?B?b0RudHVyUHM5MTA2QjZpeER2Qm5oWU5XSDdoWEJoTHZVV05TeURFRmNXNVJM?=
 =?utf-8?B?RklhY2NyczN6N0RaVnA4cVdwUHZ2ckFrM1owL01NMUd5QzB4Rno4T3FuVUw0?=
 =?utf-8?B?MkFqR0lqdG1HS0ZKT284RXJseGRya3czTHFTbC9jYm1TUWtLazRGWTlMVFpQ?=
 =?utf-8?B?cHNGREpaekFRMEVoNFRqQXY0Slhqd2dQTGI4TURkZnExcDFsM0owYTVFcG5D?=
 =?utf-8?B?NWdNNWFDeEZ4SXBTd05IMjFrMGx6WDRoTU13NmJDUUV0UFUxMHhKOU1FZVRY?=
 =?utf-8?B?eFh4Zm5mNDQ2UEUveWJ6L3VkZ0MxRlV5bWVkWVhGZ3BVeis0RnMzTDVDM25q?=
 =?utf-8?B?cm96YUxFVzVOTjRqY0FTYzZqbmtWNWRVRGVRS3MvbStNOTgvRk8yclZjb3Fs?=
 =?utf-8?B?ZCtyN0xhUEMxSlJYUHRVM21EbWMyRGlnYnZDbGxUQUVKY1g0bFYzVzF2VTh4?=
 =?utf-8?B?QVdlVllsVGZqeWQ3eFpkajg0R0NsdUJmOElXZWFwbFduYVpIRXc1VkEwcm50?=
 =?utf-8?B?NVVrSU9SV3p6b0pNU1RqUmE5MktuTHRVNlE3anBydWc4RzBxZWVjdnhUYzR1?=
 =?utf-8?B?M0pXeTJEb0I3OWsvUGRpYjJWRFMyemdMUVN2UzJTa3VhZXdqRHlJa2ZnNnFS?=
 =?utf-8?B?R29WMnpKQysveVZSNnBQbWtaNjRzMytFK3FXVEp4WHR3MnpKWFdIdmpTbnRh?=
 =?utf-8?Q?FHd6hlhYXlNz5S2261fpseAC9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a755da-5927-4315-9151-08dba2296ad0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:31:37.3837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzuuHpTAN2dN6NFQPay/ucyKlMcOTE/Cu16mr2cIJEGa7xiPhQv4K8s+uOxgHJb7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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
Cc: yifan1.zhang@amd.com, guchun.chen@amd.com, lijo.lazar@amd.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, le.ma@amd.com, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, Yuliang.Shi@amd.com, candice.li@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.08.23 um 09:37 schrieb Su Hui:
> smatch error:
> drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1257 amdgpu_discovery_reg_base_init() error:
> testing array offset 'adev->vcn.num_vcn_inst' after use.
>
> change the assignment order to avoid buffer overflow.
>
> Fixes: c40bdfb2ffa4 ("drm/amdgpu: fix incorrect VCN revision in SRIOV")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> changes in v2:
>   - fix the error about ip->revision (thanks to Christophe JAILLET).
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 8e1cfc87122d..b07bfd106a9b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1250,11 +1250,10 @@ static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>   				 *     0b10 : encode is disabled
>   				 *     0b01 : decode is disabled
>   				 */
> -				adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
> -					ip->revision & 0xc0;
> -				ip->revision &= ~0xc0;
>   				if (adev->vcn.num_vcn_inst <
>   				    AMDGPU_MAX_VCN_INSTANCES) {
> +					adev->vcn.vcn_config[adev->vcn.num_vcn_inst] =
> +						ip->revision & 0xc0;
>   					adev->vcn.num_vcn_inst++;
>   					adev->vcn.inst_mask |=
>   						(1U << ip->instance_number);
> @@ -1265,6 +1264,7 @@ static int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>   						adev->vcn.num_vcn_inst + 1,
>   						AMDGPU_MAX_VCN_INSTANCES);
>   				}
> +				ip->revision &= ~0xc0;

That doesn't looks correct either. The assignment is intentionally 
outside of the "if".

See "adev->vcn.vcn_config[adev->vcn.num_vcn_inst] = ip->revision & 
0xc0;" is always valid.

We just avoid incrementing num_vcn_inst when we already have to many.

Regards,
Christian.


>   			}
>   			if (le16_to_cpu(ip->hw_id) == SDMA0_HWID ||
>   			    le16_to_cpu(ip->hw_id) == SDMA1_HWID ||

