Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31595F4A77
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 22:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EE310E10F;
	Tue,  4 Oct 2022 20:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB86410E106;
 Tue,  4 Oct 2022 20:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2xVFTq9SNO7TFCg/aqpFv6VzKANSxYuww9Yjy9SBKW8EIoceAx71u7fvIuIX9iKVcZLYZIPmcdOqo3TpuI9No9U3fdjeRSN9w/H457C81YNMjMnqgUlO4As45wtwvLu1bcJVUQ0Ud+frikmZWKOga5OxVIVRbNM6vzASgLCog/SGAl0pwFuDxVlClhgGeaQBjEGtEEQybRRqqBcbIFaCYZlb9zsMbiSwxHH4zwVyI6h+QgfbgyX1qrS7V06p9XfoB/hFjdVqip47yuuhz4luUEesKn3/XlbRPmwd7kL21EG44WsmIlrSerIAl/8G3u5PjapEDscktn1HtK8vcNC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ks4OwvTKiwBw2ZIwzAKvBlF+TC6QLTJM4j3Jgj4qEfg=;
 b=UejUsGx5WlnJuNhnncTTxGSEFU9WoMnkAXpzfv+hztUqGaCyYcfDsTUFX6pyNGxVcR0/okask7aMGYllovsPSO5hNb5YFPNDCjG2dhi5jiBiENNjvh2xr0Mxv5fcjnO0uPA/zhscCyPDDjVsfnget0rNIIupTcNE85PoU2J1vDRSzCH0hYA+GD0LCV0BFOKHLihgANrh27npjzE5CgWkiTot9jrTBIDkqtYR0jRjC75C+42tKgkH0LCKu/TQf1Bjca05+GTI8BEyHJM2MSrNPt9+HZpidS+vUloRyvx0tGqrbheOcPQfiGXXNXwMKR1KVOGRx9nlppOtUAolynv9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks4OwvTKiwBw2ZIwzAKvBlF+TC6QLTJM4j3Jgj4qEfg=;
 b=qT2UI+J5X2Vj6dYg8DFPOJ75xJwOr4c/2QGmJzT99ZWIHFnZqWXCmFl2ykaPcpSW6PAL0ejosBIT3JbpVJpaJ0XxEzNwwOBg//LjFQvNl9XUGnyjN8MYNXB1jv6G3UzvYqXud35x8iDEexwEGT8ZFRsKvmVirfF6028Wyu2gr2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by SJ0PR12MB5609.namprd12.prod.outlook.com (2603:10b6:a03:42c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.30; Tue, 4 Oct
 2022 20:46:46 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::588c:ac12:d318:bfee%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 20:46:46 +0000
Message-ID: <d3b272e1-3b5d-c843-e8ac-57dc5e3a7ced@amd.com>
Date: Tue, 4 Oct 2022 16:46:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix incorrect usage of
 drm_dp_add_payload_part2()
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221004202429.124422-1-lyude@redhat.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20221004202429.124422-1-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:208:160::21) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB2941:EE_|SJ0PR12MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2af34a-b5a1-40f1-0c50-08daa6498dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKLwt0E7jjqPDQmxpWPq2P0tP3lRvA87JhK8u4E11sx/jAm2EhLDMrr3tlrHI/RVkMn5ryKI7V390O/O7qpxqAJGx0SxdYa8i/ceHZ4T2k61B4vsSmUcPmYrDRFOcb6nq+hNfYow51EVTL4rnFtrFFIUosLyQDDGavDa20g4rDWTPen6mTdV5LkN+q8cbZtr2q6+35IKvbWe1RzOw4NlzNH8CO1Nrt7rfuiMFmylSQqcW89yZfm5aFSIBltPIUazGVf3zFg+FTZU1kiC2qzq7zycy7zoE1nB2sL0nISvg9r+VwaQxsXxrVgZMWZhFxz0fj1v4en+S9lysGq7CXLclarqVVjtcuU5umTf/IXXVJX2tLBcp97jw8IygEQuroQJcU5pp6Pvl9rRKsiKTcHp3XUa7oBvBlXc2KSxnfBE84HzbIfoF/4gOAIwgDJlCyOwY06C59FnTxHF7NKZrHIuIqg5bASeDth9YXN43H6ZpqZuqu94CtIKs2s/0KyF61IIuO2m4A+6dBwhB0KNcOgn4jX2TPkU0GX50XxvoetaV5B/pizTRZhLTFCy9/aQgRDNT1UER0oSTXFnWFXq3KH2oCAoEN7dYRxkP9LeqeoaW0YL2DhnGItuLO06kSaswdzXpfe8HWG6OOrP8eg84OBXIMA1I7fTPAnXQvqyb6/OItAkRF77SeZDY0QXUIJ3CkpJ8tm8vxykPVXf1HbW8fy59XnkFiTmeQ+wtJIbxUmZJ/kY9uYjUisXV+zjvTVH4OO/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(4326008)(66556008)(8676002)(66476007)(186003)(83380400001)(41300700001)(36756003)(66946007)(6512007)(966005)(6486002)(38100700002)(26005)(53546011)(478600001)(86362001)(31696002)(6506007)(54906003)(316002)(2616005)(31686004)(2906002)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amVMczhyNnZrUUVONzZoOHI0d0xTYlVuOG1PbFJDczV0NnlHRUJmMGtJSnRM?=
 =?utf-8?B?bjdVa09ocUZEb1piZzllYlBBK2ZnM3B3YnNHRHEzSnBSZlk4R3NadVN3TDVs?=
 =?utf-8?B?OUlFakszTUMxYzkxSDFhZk83MXZOaFY5Si9hZ1NEdkpqMkRaRldFdnNtR21F?=
 =?utf-8?B?R2hxNGRJWk9Xcnh0NTBLa3dKejZVOVFpNWQ3eS9XQURZWXBSTFhYK2JLcHZV?=
 =?utf-8?B?d2hKQ3RXaXY2QTlhZnEzMHRZQXAxaWZBbTZtR1RzYWxEQVdqd3ZLR3IzYWhH?=
 =?utf-8?B?aUtNb1FxUVB4RHZtZkRtYkRBTzd0YXByeTJBNnJkMVNYWm10Uk9OY1JNTjE3?=
 =?utf-8?B?bWVCb282Si9wdFBnd0l6VkZ2RXdnaURsN2ExTHMwUHFRdU1OMHBtclFWOVp6?=
 =?utf-8?B?d2pObXppV3lsNUlpYnlBUnAxK2IyekM2WE1VTU5iZWljVGtKc0JFdi9RUEYw?=
 =?utf-8?B?THQyT0g0Z3c1UGRLMktUY2F5TmhoVi9WUm1xblY2ZlBDSFJ2amozN1lZQ0gw?=
 =?utf-8?B?YmxLNTc2V1MyZy9Ydng3MFN3ZVlldnlQVVluSlhwQ25YdWxtQWRGczQ5RGlw?=
 =?utf-8?B?U2l5amdQZDg2T1BvTzlkRmFRbVdxeFlQSzNqTTcyT0F2QWhkalU2OHZOcERE?=
 =?utf-8?B?R2QzU01melRZaXh3VS9SWVg0dVoxM2MxQXBFNGxEMm03YmlNU3V5TkVoSkQ1?=
 =?utf-8?B?eFFOT2pmNDVtazhleFVCUU9VaXFkNWpnVmxIbDQ0ckdKU3VBY29WT1ZsbTJs?=
 =?utf-8?B?aU1XZ0Rhd28rdFhNMWpUT0FFeE9nV3FOR0FMdEE0VXhSN25NS2lnUGtLeXg4?=
 =?utf-8?B?S1loLzBYMG03NTEyT0FQYkRiYnRrYkNTc3RTZUE2TGFqUVZtWXFSNitKWmI4?=
 =?utf-8?B?NzNhZTBmV2NXeEJ1Wi9DOUduY2YxRzM5dEtjNlVaNlNxalRhb00yUCtuT290?=
 =?utf-8?B?QlpVU2YwTjhTLzhzdWRzQ1FiY2FocWhUb2tuQ1Btcllvb0dGUVhjUnJNVURm?=
 =?utf-8?B?cmlIRmxsRjNVUys4aitaWnJ4TXRMRVZmUHE2QVIvNVkzNzMrQzB0VmtucmRF?=
 =?utf-8?B?WUNGeTRUY1hsMzJjMVhsWExmRktIMlNCeXVsZXY4cFMzL1hWWVBZUnM1UDg0?=
 =?utf-8?B?bXFyZlMwdU5oVjZ4dWF1cHl1bkM5a3ZYb1kyS01tYTY5KzMySS9zY0s0OUZz?=
 =?utf-8?B?aXZKNEhIc2tZdjAxWk0wa2duckxOZE84ZlAxeGhpTllVUktEUFQwU2VidVkv?=
 =?utf-8?B?VGNBaUxvS0JRcTNYWW5aSUh3WVFTazlVUmkyVzV6bWgwVUxTNUYxbGE2WHM4?=
 =?utf-8?B?ZXRXbWZ4QU4xMWIwazZwam9EdDlOZDFYb2IxaTdqYy9sOCtoVDNneHUyVWtB?=
 =?utf-8?B?OVE2SjBCbHNLTTJzWCtTby9PNTZ1R0dXZnZzTFpabjRUVVQrY21oelNzSWNZ?=
 =?utf-8?B?Q0ZIc3MrVzNyaGx5bE5WdkJPQ3VkNVQwaTlyRjVvaWxuYzBmYnFBWEpMdXNG?=
 =?utf-8?B?aDArR3I0VU43b2dBbzk0L2V1bVNpL1ZYKzZubFJ3OGlZeGhkTVBHUlp5L2I1?=
 =?utf-8?B?Tyt5dTZidzJGKzEzTHRHTlRlVG1MdWIwblkyVTlsVWhONTRSYllSRW1TTkI1?=
 =?utf-8?B?UUVPaFFlL2xrL1laNkpsZ2dtTWUxakk1ZmQ0OUFGU3pucmZPaVBRdVVxU2da?=
 =?utf-8?B?YldWdWFQQzBJTEo1NlE3YllVN2o2WTAxNDVaZ0ZEVnN4VHpmN1d1b1ZOY1Uw?=
 =?utf-8?B?Q0JzM1hhcXkvWElVNzVGVlRBT2xVNFhscGJDMVZvVk8xLzZNUkxCWCtnbWZF?=
 =?utf-8?B?Ty9iUXdEWUxXYzRJSDY1K3VzVW56bUJ4VVhkbExRa0NMcmloNlo4VUc2RjRU?=
 =?utf-8?B?dlBzVFYzejVHUitPajNwNnliT25UdHpyNmRGNnkzaGVDRGdDeDFaTldsM09K?=
 =?utf-8?B?U1BPbVpXMGp0ZWdnM0Zud1RHVjE1eGJzZUx1RnVyakV5QjM3TlpOdENpeFBu?=
 =?utf-8?B?b1ZGeU9laGlXR2JVWWRwREUzOUl1Z0tjTTVjcThsQThRdjZ5VWNlaWs3d3dX?=
 =?utf-8?B?dHlteTFaaUdjUlB3QVhBNjkwOGZwTkI3cnZXVVZIV3hla2YzUkFGMVM5dmJi?=
 =?utf-8?Q?/3hv1TFhAcwdRzsWo2S1tvG4Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2af34a-b5a1-40f1-0c50-08daa6498dac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 20:46:46.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p4Aw+IUpYpvt2/CziotvdWirUne9LQVozRkIE8xf2OcNdCelcD6CjH6bEbMFepvbSvonla+dpoLSYTJ8eRSe3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5609
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
Cc: Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-10-04 16:24, Lyude Paul wrote:
> Yikes, it appears somehow I totally made a mistake here. We're currently
> checking to see if drm_dp_add_payload_part2() returns a non-zero value to
> indicate success. That's totally wrong though, as this function only
> returns a zero value on success - not the other way around.
> 
> So, fix that.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2171
> Fixes: 4d07b0bc4034 ("drm/display/dp_mst: Move all payload info into the atomic state")
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index b8077fcd4651..00598def5b39 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -297,7 +297,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>   		clr_flag = MST_ALLOCATE_NEW_PAYLOAD;
>   	}
>   
> -	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload)) {
> +	if (enable && drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, payload) == 0) {
>   		amdgpu_dm_set_mst_status(&aconnector->mst_status,
>   			set_flag, false);
>   	} else {

Hi Lyude,

Maybe I'm missing something, but I can't find the 
drm_dp_add_payload_part2() function on amd-staging-drm-next. Which repo 
are you using?

Thanks
Siqueira

