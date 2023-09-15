Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE797A2019
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 15:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266FF10E633;
	Fri, 15 Sep 2023 13:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9461610E62F;
 Fri, 15 Sep 2023 13:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIA1K2ynNCm/UtuycebLep77r/k1fClGFoYxw26DKIoKM1MXvQyiu56f9/zerf2D4uBdcDZyN990Kmt2leYLGh+wQXKn9qJG5BhAqx9TKTbb/4b9OcXZ3UgZsg3kchR1SAAXmeChGPCXrU/8TG+DfSuj8tVp2gm7bIbocUtVVwNXZIGqjc7fXXnYVsioSIopl+EwOXGdu+Yc3cQKZO0vAVFYRtx0r4pMaWfkq/q870cHpLw41sckyF9UKrr+1BJMUyFPPFFc9fcx2PUFA3jeYs8NPYdjvit9wPkz1NycP288kSS7je/L0lSz0W0yVf4XiF/zkxSCBqtvcVg9koAMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQeA95Z9wB4nmH8UYIOspVLLhelITD8qlsAoHFt9Ceg=;
 b=KSzb8LHd0LLXxBmbfA0f1doBLSrIL03CjWoCu2KtWxhAZbGCqNntM8WRXzNDG4ManJRBtMgtiYiVI31h/gWG0l6rqKetRmJic1JiZDf7v/+rD5gzyw0gZLcrGe7gEtkCGjWgL0eqeGBkv3h8PLqvJd/UffaV+7KtDnBw/howEvsYRcS+PxqUw3MlQdSFIzPWbIyk4WituySGHTuIpkZ87L8UgW7aGBB8sABPigrhARrvfiZI1cvfDb3+4CgWg7QslT82ciuRuBNTOZbiZYG+83R2uDK80z0OUlqhP1eQ3nknJgWyE7wxfnPcKfy+3XUxcDg+fEFO2abr2igzW7xk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQeA95Z9wB4nmH8UYIOspVLLhelITD8qlsAoHFt9Ceg=;
 b=r2baE3EkHtbc9Ndoo8N3teOGSF52YPXK9U9cb3y2a8CQPXAQJn0px6FqiCOCMxyly4GlGu17b8YxpsnbyYHhywy4NRqXWmrPnHfW8xaEiKZjz6tbl3eAbp2f7JOSM0pgnoR6McRvNQwMXG439ZzV0ymfJ/O9XpVz6291jauk88I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 13:47:34 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6792.020; Fri, 15 Sep 2023
 13:47:33 +0000
Message-ID: <39a7f19a-e6b6-4962-b7e0-4f33cb78938c@amd.com>
Date: Fri, 15 Sep 2023 09:47:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Remove unwanted drm edid references
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230905171354.2657889-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230905171354.2657889-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0266.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA0PR12MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: d28bb489-d54f-4a0e-7f89-08dbb5f25002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6h3/dIZziMpBDs4LxtgtVzQs5AUpsj7tltKit4hgVfRHHgtp7/yKPn2eu7fETMuLAWtuGkNCim3aJ/LdlQaId3ehl7mldSUVMxb6Zt40NobC9xjMPkXTrreF1dm9jcje5agPucG2Gr3xbGK9s4C/J5Gp+28gVJGblfapqiA6X5b3tJzY7PFapggZNt/NioOM7IunREll8J1SI5bTtQMVnLnrMHW4LQ5/XnqUo0N0TUwHbaEaXEc2qfqRs2UKfsJLQwFQk47Hi/gc9QCAz4G9liJYrHzFtj3VqqjQs1GzKWWlWNhjYwLKpyKyiqvVXoVRaanku0z9vpqfoT7qTtJpBWTdKDLz91tDvonG0HBqJB3TlmMYyKmJ/D17FttZMuk7rAojw1cPc86tP2T5zjNDMjdZYCboZzCYHEyqY+EOhPM3jBU6uWp6mQP7v8BidBfhIw+y7W6W1DPQdPY8QVdPfWsWmGrkWPpoSZXGGNl3Mm6u4DPe8YBcn9QBKkOeDP30pTQgoBYFbJrxc18mJeJgln6qRZxR7NR1OE3C3rddr2jewRaNRUNRT6eCcFN91+WQaRadciQ2vE2q5mVBIokXlWk8W8tSaXz109llWNd5xzf5vA90nMBDjZsyleV/mMotLbPjnyP75jxipDGjl9m9c0H1oBo1jg3gLGbxWhjsPT4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(1800799009)(186009)(451199024)(44832011)(5660300002)(8936002)(8676002)(41300700001)(66476007)(316002)(4326008)(2906002)(66556008)(66946007)(6512007)(38100700002)(83380400001)(6666004)(6486002)(6506007)(53546011)(36756003)(31696002)(86362001)(26005)(2616005)(31686004)(478600001)(26123001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ykp0OHBLQVNPcW9Ja2krMUxuekszRGVjdnlZZ3lmTTBHTWxMbkhmK1kyYnk0?=
 =?utf-8?B?VmRDaHkzRWdMcHhHZ0wremRZVDU5MjdLYWhGMWM3UGtzTlFITVlSaUJXMEl4?=
 =?utf-8?B?bXFLRGdUdmxFcDFiOXhtT0NSci9NTjlkSldMMGp1bktadnduOVJQeVlrdHRz?=
 =?utf-8?B?Wk5lZWZoN0VIaWdZcXI5Rm5qakNZV1VybXZGcFZNK0NoU2JjK2RKc1dja05D?=
 =?utf-8?B?Z1FyaU9LNzA5VVFzTzlJdWs3RC9lZ2k0S09mR0RwQ01qTDAzajBKUHhoekFU?=
 =?utf-8?B?MGV3VWs5aDFRbExobkFCOFhsdHFZald2eGp3bjF4cURxYWtqVTYyblRtRVJn?=
 =?utf-8?B?N0dzbGU1MmE1akY1VmcvSDJWVXd0OUdXMVBVd1FZYzdGdU9kN2RkdXFKSDdB?=
 =?utf-8?B?WllNNGNVaGx2UUlkV3l3cTFPSWllTUNjUFNtN284QkpUN041S1ZoNXR6UEtZ?=
 =?utf-8?B?SW53UFArWGR6NVVPeFpxLzFoRUYxK0RtWmhERkhwLzdHeHpuS0ZpbDJxd09O?=
 =?utf-8?B?U1RvenhzbFdHYWFHRGNoUzZ3U1VjZk05K3R6Q2RSWE5UTGZkblhadXYyZkxT?=
 =?utf-8?B?TGxHMWtHWGhXNzgwTE9vQU10OC9TWUNlSzEvNXg2anNmTzFlakh6WmR1aUp5?=
 =?utf-8?B?b0hyUVJNamhod1FRVWtsL1VuSTgrTld3Mk1YY3NrS2lLQXZ0UDgveG9EcGF1?=
 =?utf-8?B?MGVJVFl2Y2lpQTBVdzdYcGpXNXhzdndhSmsyTWpJVTRxTSt2dTIya2JQVmhv?=
 =?utf-8?B?VEFEeTB0NmkwVGttNkVCNHhqNTh6ZGhTd3MxSTNxL0tRZ0RtQnpNL3FMVyti?=
 =?utf-8?B?bWM0V3lCbFU4cXRtUGEyMXhDNmR3YzZnM1ozQkN2QlcrMjEyb3lLd3lxc0Ni?=
 =?utf-8?B?bXVPcWdobUV5Wk92anZ1U1BHTEZhR2lMeTE2V1IwNmgyem1IckdPTXdHU1NH?=
 =?utf-8?B?SHc0emxXcE02ODdMTzB3MUIvdlhUU1JnNVc0K2FGSFV5UGNQWS9BMjY3V2ZG?=
 =?utf-8?B?d2JvSmpWQTFNLzlURnFHQ1FNREtEMHhTVURjb1lDeS9xanpndTQ0RFVBaW4r?=
 =?utf-8?B?aUt1MmNXdkZMQnAwOC83ZkM1R1pLR0ZCNi9Tam9hM2s4dUtFaDZMaDZNNDha?=
 =?utf-8?B?blB3M0pVUEUvWWlkNWxFWGRjVS9iNHgyZGV0OHFvbzZHWEd0L1VnVWZyWVJR?=
 =?utf-8?B?dVNoaGxZdFJnKzNPekZmSSt1NmZLTUdlb3JxekRHcXNiWGtkM2Vnc2I4NUdB?=
 =?utf-8?B?eUFDb28wQUpMN0xyUWtMR3orT0hDQ01VbC9GdzFVa24vbHN1RHlTOGxpc2pI?=
 =?utf-8?B?Sm5rOUEvVC9GUXBZdzk3bk9XWWkxdkRaY1V6dzRqYXhtTEhQTFdBNlJZYlZn?=
 =?utf-8?B?Uk1HWjRVd2FqOFFxRTNIZEl6dlFkSFN3Snh6UXB5WmpwUXdHcmErNmkrK3Mw?=
 =?utf-8?B?SFBlbEtNMDZpSENwK1h5THkrK3J1ZnJHZzkzSWtuN0tRdFJlYWNVVlczN0lm?=
 =?utf-8?B?THZSSG5wdml6WERiT2R3K0ZLK2xlZElCOFUyRlJmZWVuK0srWk5mS2plODZt?=
 =?utf-8?B?ekwwRVFkRjRpSjFxRnRKMTBlZ2lIQmVJZ2pLMVJIbXNmU29EYThMUnA4QVhy?=
 =?utf-8?B?b0tLSFlGR2hwcGR6YjllOS9VZ0ZlOVQ0Nm12OER0SUJhNDJLandiNW8zZTJz?=
 =?utf-8?B?cENUd1YwTU9BdEdwQWFIYlVOZUZhQWNORTNFd3psa080NU5wVDhVR3pjdCtP?=
 =?utf-8?B?eWEvSFhCK2N2UWdINkJKam5KT21UNldhdHBTeDBjWmx1OFlTQjJqT3JTY09F?=
 =?utf-8?B?bEhaMGM2VHRLM0hsWGdtUGlvSlFJKzRVK0J5Zm9FM2NoblkvMkRUMXR2R254?=
 =?utf-8?B?b3VVc25vNmNTZHRmQk15dmlPNVdrZmdrNmFjelVjb2lJMUJyemtKNGJGQ3VF?=
 =?utf-8?B?cDlLQzI3L01TNklXRmNJZHZhRlM2Y3J0WFBZazk5c0thK1ExUGEzdWVUZ2dO?=
 =?utf-8?B?NUlYNjgwMEVsT2R3cTNUdm9YbC9LU0ZTNVBsMnphUUxmLzNwdCtTQmlURzVU?=
 =?utf-8?B?YjZQQkRKY2tjSG5EWWxsTThpQ2tRYThKVkcvdWF0NHI4ck5hT21FNzdIWFgr?=
 =?utf-8?Q?yNJaBV+15Q2KaAJXCZAibgEvv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28bb489-d54f-4a0e-7f89-08dbb5f25002
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 13:47:33.4789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVgC+W9GOp5TVVDRqRSSgWlgBXTimA4sHv3cVXHvP/Ktuz+liq9ck3TUZcvGLWIPFmNXkdVy/nHhKtixOB2znQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
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
Cc: stylon.wang@amd.com, haoping.liu@amd.com, srinivasan.shanmugam@amd.com,
 jani.nikula@intel.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, sunpeng.li@amd.com, daniel.wheeler@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-05 13:13, Alex Hung wrote:
> [WHY]
> edid_override and drm_edid_override_connector_update, according to drm
> documentation, should not be referred outside drm_edid.
> 
> [HOW]
> Remove and replace them accordingly.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++-----------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 1bb1a394f55f..f6a255773242 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6372,15 +6372,12 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>  static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>  {
>  	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
>  	struct dc_link *dc_link = aconnector->dc_link;
>  	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
>  	struct edid *edid;
>  
> -	if (!connector->edid_override)
> -		return;
> -
> -	drm_edid_override_connector_update(&aconnector->base);
> -	edid = aconnector->base.edid_blob_ptr->data;
> +	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);

Looks like we only call this in the case where a connector is forced, so
drm_get_edid will never try to read the edid from the ddc but always gives
us the override_edid. Please spell that out in the commit description so
anyone else looking at the patch doesn't have to trace it themselves.

>  	aconnector->edid = edid;
>  
>  	/* Update emulated (virtual) sink's EDID */
> @@ -6421,22 +6418,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
>  	};
>  	struct edid *edid;
>  
> -	if (!aconnector->base.edid_blob_ptr) {

Can edid_blob_ptr never be NULL?

Harry

> -		/* if connector->edid_override valid, pass
> -		 * it to edid_override to edid_blob_ptr
> -		 */
> -
> -		drm_edid_override_connector_update(&aconnector->base);
> -
> -		if (!aconnector->base.edid_blob_ptr) {
> -			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
> -					aconnector->base.name);
> -
> -			aconnector->base.force = DRM_FORCE_OFF;
> -			return;
> -		}
> -	}
> -
>  	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
>  
>  	aconnector->edid = edid;

