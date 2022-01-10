Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077FD489DA6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 17:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2C10E421;
	Mon, 10 Jan 2022 16:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440C010E421;
 Mon, 10 Jan 2022 16:34:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU584mwATm3BfTd3qCyWfbA5HmszwTRwzB7cH96A7xPV8ITCVwzj1WOmbgkImpd1jvzvx7K60p5cNpdiVYqlOFVDtLjpDX1LpWAiwpo7ie5RwBhoIGmOxNpKysSMYomrJOcWQ4LBwnnl4/ryf8scqoksITpvByiHZKgk8jyCLmxHa+RYZvT0kaOqGHJ/XM9QggMcObE0K62wSUFUhPanjpCNRzW6K4JpkU0LFLncJVBwiikPRoNMWfHPHlMoLVb9Ks21It3gtNYdDVzQjhL86KgsNftAJ3Vt8au10P7A1F7AtUegghYuxEFtd+Zqm+6sspNGzx6/3KoSaKOCetQSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ1QROjC4kBaC9KlbIfAPilQ3FWXF8JbRUk9b6TxfMc=;
 b=nmL68BCUv2TGDRPsyGaik/kamCbq4/HUZrpOrWSyMayMW/WPX76zVzkKhcKOiddnZF1kKUUy6VcFZHPyAXFjnOS1R720YQlHk2jF7kiRhe53z0z3SiEd2krW4yazDhkhoHcDCkFsXd/8sUWvH/+oGR5XtCOSJ0fAWxwsfSqUS9oaru11XQzd30rYlVlD4KzMyyonkfOp05C3VMvr4yZi0FkLj8XMkriY6K9vkRJQpmpDGoMFp6hpoNgqzMvlFP6HG/xwK16i9mJN42Ni1f69NQhJ7H+yQrbRKYh8snAip3J+PAfVHzShEJn7ALwPvP4Xh9BlvU8VIYx4qsLFqTk19A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ1QROjC4kBaC9KlbIfAPilQ3FWXF8JbRUk9b6TxfMc=;
 b=UZUqC/qEREEZlcBy1GviItlFYuy7scdhPK1MSNzmEPP35EfyJXBsbQ45jkN6lFGHhlK1l776OuoHoRSy50mitjBcqM5eohN5KpkG+65LTlzET1U6LAh8uc4KKMdErVsqZNNGU845z3XgSWgvpii+KWL3L7ktOlJVOoWkI6b+FbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5393.namprd12.prod.outlook.com (2603:10b6:5:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:34:49 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 16:34:49 +0000
Message-ID: <139784cd-6cb7-18e0-bb09-b35113bd83ef@amd.com>
Date: Mon, 10 Jan 2022 11:34:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/amd/display: invalid parameter check in
 dmub_hpd_callback
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 shenshih@amd.com
References: <20220109184245.124850-1-jose.exposito89@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220109184245.124850-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0304.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6523867a-b1e5-4f31-a69f-08d9d4571e5e
X-MS-TrafficTypeDiagnostic: CO6PR12MB5393:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB53938AF30DF4EBB799E7E0218C509@CO6PR12MB5393.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBeQSXO8YPSgEY+Qqaq69ONUk6hfrgWBeb5LmVFnXz2xRsphdI/np0F8YnnoA0RFKx2WaHm6kJ53AW+CmXBi4g6YWVoiNasGl1FbMISwTMG03rRFANN55pvUY7zP9OBHRlTA6chhT5CMlA8askVHawRUBhbFrSTCNgYuPP9k73rENWFtZwL7aqLK3UwXa4i/XI/jR6T1gPhTY7cH4exuDS+j0glB/azl9lman2N8HmqMk8ISfQMp0AlM7rdcrvIppjiWdhyquC/XTzwOOgXRutRDF9Tm+pyxH1LLj8I4oO2tDe/xh0iTvhNf5QMUTxFqwQVWZK49Iwjogh/8D2uyV+ayiSgNbFrlW+zRYHgoScIvQP13Lu6ksYKAb6solF13iHJMfLba2xn1JIZT4+k9fSbs/g0bNcqVMwTI+DYzeR0IfNW2ZKv/TPgaK0sA5/x+GhJN96DQd+wE6PxzMT+jsvIISvSo10uPT2yanK392TCltOusaSQZYZayIH4caadGzgKpydHk5jEjytJftYvGl8n1lwDoJjCZ5KmUYIflUr34DsEaA2IBng11QwKSwkex5fe7+j1GzeQkhXlW0tlwsgQr/9K84iTagLF4xgB5jd7d9WqNWcxA9Kn2L56lmsuoWylZ1ZvrJHaiQqVUK4bGTuQOs/MafHj7ASS4lCO/TtSURTfkoCqGs6MJeYAQIseaqcStu4/Y7TYaMIHYxxHmP45oY1cmSJTczX+CGKUem1dAkfU3eUCGSZATev8iERwL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(2616005)(66946007)(6666004)(83380400001)(6512007)(2906002)(31686004)(8676002)(66556008)(66574015)(31696002)(86362001)(4326008)(6636002)(6506007)(53546011)(66476007)(36756003)(8936002)(44832011)(6486002)(38100700002)(186003)(26005)(316002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REpYcXhiNXJsRzkrSVk0NFZMdE90eUVYdmQxS0JVRThNSjhySEsveWx6YXZh?=
 =?utf-8?B?VjVRa1drNHo2Z1lYTGp1UmU1dWhMMnJ4OFRFUjZOK2w4VHVHVy9Ca3ptK05X?=
 =?utf-8?B?MnpiV293NlNmWHlnZVY3bE13T0lpbEdSaWt4VHFRNytHdnNZczk0dUtIVXMy?=
 =?utf-8?B?Um4zSU8wc0xBNThPa0RNdEVYakJMMGl3NnFSQ0tTL1U3bGp1cWtoWG55amUz?=
 =?utf-8?B?VGZKMW1EWDZEb0g5UVNrYThsZms2UlBvRHNWcmRnYmNkb25kRUpjM29iL3FE?=
 =?utf-8?B?Zk1RbnJoZ1QxNGFvcXdVdUFwYlJ0a1hBTnlkY1E5Sk41Y0gwL2xYOElYaVpV?=
 =?utf-8?B?bmxZUlBsNzFtNCtzUmRxdFg1Vi9iYXB3NGpnTnBsWXVBQkhOQzN2Ymx4K3hh?=
 =?utf-8?B?KzF5Z3JmazJocWZFdW0yK1JzcHJKMmwwZVJVSDV5L1M5enlVR3VDbHltOWds?=
 =?utf-8?B?T1RybzN3WjRHaWY2RFpqT3dqL2FLSkhGQjNqNWNDbklPL0g5OWdtcVB0bm5o?=
 =?utf-8?B?c0dNNUxjR2ErODQ3UTZ0S2RtczV1b3NHZTZQeTVTYzBjcnY4cENBN2FiNDhU?=
 =?utf-8?B?bWtNSUdkbmZCbVFJMUN2Y0pEdE80NnlUM2N2Qkcydi9KV3RlZXFHODlhaFA5?=
 =?utf-8?B?TEhYMG5xbTFob3haNzY4RWl1NG5yTzI4QmFEbFcwYkxvVDRiTm0yZldpM3R0?=
 =?utf-8?B?M1ZzVmpuOUFsRkZXRDlJTFRFanhSZHZ1cnBSV2JhdDdCR2tNNE1hZCtNdWlj?=
 =?utf-8?B?WDFGRFR3ZEY4aTlSNFRtNVhRQ3c5aWsyY2REbys2bzBHOHBOMjMwa2pGQU1J?=
 =?utf-8?B?bEJibW5QQ1lzRlNCZnlVbUNCWjJyL3ZOOUJNa2tOUXNsdUNSM3VOaVZqejlP?=
 =?utf-8?B?d0tyVjBuSDQwcTVqRjJuT3lxcHNCUmFEZ0xWVXN1aHVQMlBPd1ZvWmxKbnZr?=
 =?utf-8?B?MjNnNWkvQTA1MitvYjJhYXQzN3dHSnVCK2tmR2owS2xqR2tHZlRiNGg1azRF?=
 =?utf-8?B?dXRseGk2U0JPN0VJTGNkdU0vZkNtQWJ4aXh3Tm1Qd2l0YS9vdGlKVGNreHFT?=
 =?utf-8?B?N1hjcG8yTTlrb1h1ZXk3N3VmSzFFaHMyYVpjeTF0OGFsejArSXl4NS8wL3BY?=
 =?utf-8?B?dXd3Vi9zc3RJY0EzQzYxVWRIbWlocDQ3UmVYVkZocUd1T0tBcUIrSExMS1RP?=
 =?utf-8?B?YW94K1VSUlAxdzVjMi85Q1lhNFNzaE5CZlFNTTZCOVNaaDZkOCs0N3JZcGxr?=
 =?utf-8?B?WlNPWDZoR2liSjdmMHBpZkk3dDE1cXBnSzJCU1dBMndzb2dsMVRkdHR4Y0lZ?=
 =?utf-8?B?akF2SzVYbExmRkJUN3ZhZGF2T0dkQWZVY0E0emp2a2JGYjRHNnd3QlVsUmx3?=
 =?utf-8?B?RUtnSURjcGMxYjIwNUVQNlpMRnp2emYxZ1dJQ0dyaWkwb0VrZ2E1eW95NWwy?=
 =?utf-8?B?OXVIME01NE5KMFVUMStPVVd0OWRKZUdoUFExMERqdTYvMDE5ZjcvcUoxUVVU?=
 =?utf-8?B?MnhwQjdyMlFSQXg3WTNwWk0wNnkwOU9nYUI2eS83UmtzMGNydUVqTWxWR2JW?=
 =?utf-8?B?b1NmbVQ2RHk4aVlqY09pc00valVRSmFibVI4aUtvYVZSOWs5YmVoMlVITzJp?=
 =?utf-8?B?TWRDa043eTNkYk1qb2phd0VIWE13RnZxUWJlT3BqR2JLaTZhYVpWOXFyYUIy?=
 =?utf-8?B?bW5rallGdEtCNzJpRUJVeVB3Skovd0F3MzhzY0g4N1NXbWZ2aWl5L2NETTJ4?=
 =?utf-8?B?T2NJUTlldHFkaVhsMVZJMmpQTlBBTW5PTmd6STk4Ty9NS2Z6Y1lDYTdRMVY4?=
 =?utf-8?B?WFl2WG45Qm85UnlYVFNsYVU2TnRSWXhoMEVlMEg1c3JiZVd1aCtNZ0xkWTdM?=
 =?utf-8?B?OFkxMHlGbXBGL1BkN1VnTVZTOFlSWkovaVdiYzNpeG5OTFhSREVHL3BueHlq?=
 =?utf-8?B?M1k5bUNXSGRpcU5WRElMT0RNZHNPaDhRaXVzM2RLSUpXMXQzRmJHdDhXWkgr?=
 =?utf-8?B?TW9tMy9OdjRTd3ZYeXRBeUMxL0ZGYjd4V3lvazRoWlBrWk1YM2k5Y1VVaXhS?=
 =?utf-8?B?WDhNVDZReFNiRWhTRHgzZXZRR2lHaWlyb29CVk5BdURadVppZXVHemFZbXdQ?=
 =?utf-8?B?R1FQZy9Zem9PSVpSNEIzUnlWZVdFSFlvVTJSV3dQTmNhb0wwRkp4dkdwVjdK?=
 =?utf-8?Q?5NF07E+T1gudNJIJihAPsoQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6523867a-b1e5-4f31-a69f-08d9d4571e5e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:34:49.1866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ma69dTfjEYKJwfnrghoJwuy7u40xp16HCDnjcPNl+pRrC5XZVxA6X8i/+KGN+yTAjoRiPwByKEx7/7gVNiT5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5393
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
Cc: Anson.Jacob@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nicholas.kazlauskas@amd.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-09 13:42, José Expósito wrote:
> The function performs a check on the "adev" input parameter, however, it
> is used before the check.
> 
> Initialize the "dev" variable after the sanity check to avoid a possible
> NULL pointer dereference.
> 
> Fixes: e27c41d5b0681 ("drm/amd/display: Support for DMUB HPD interrupt handling")
> Addresses-Coverity-ID: 1493909 ("Null pointer dereference")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e727f1dd2a9a..7fbded7a6d9c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -656,7 +656,7 @@ void dmub_hpd_callback(struct amdgpu_device *adev, struct dmub_notification *not
>  	struct drm_connector_list_iter iter;
>  	struct dc_link *link;
>  	uint8_t link_index = 0;
> -	struct drm_device *dev = adev->dm.ddev;
> +	struct drm_device *dev;
>  
>  	if (adev == NULL)
>  		return;
> @@ -673,6 +673,7 @@ void dmub_hpd_callback(struct amdgpu_device *adev, struct dmub_notification *not
>  
>  	link_index = notify->link_index;
>  	link = adev->dm.dc->links[link_index];
> +	dev = adev->dm.ddev;
>  
>  	drm_connector_list_iter_begin(dev, &iter);
>  	drm_for_each_connector_iter(connector, &iter) {

