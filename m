Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D347E611
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 16:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E441E10E26A;
	Thu, 23 Dec 2021 15:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25A10E26A;
 Thu, 23 Dec 2021 15:53:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhvEYu3JYhSjrZEeXX55L8iBf5im9VJh2SyNRuJui8WtRFO3aVC7EToIXrSv8lXcvvPaIpdwdy1RYJSp/uvnu9nrAQuCLiTWVyakPYz48RjLmb1x19GlpnExu3iBSSHUwKRl0mQ0eKLgXWj265L2VoI2lAwzQxbT7NZJQCzZGt8UdOdUBF9+e4dl4ASEoEG1vJiec2lbte684+c+tJwJWmrmX/tQmzx/XoPmqhKBx3fpfr1uUmjhB2lKBXGIXuKXd0UDbQe1yYHGkv7DG+RVxHKVgntTJWw958T6NSAdHpNN+upoRUoWl+rAyHKVW3HMaxIsla4HSnJR7OJDHXjChg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOBIEYlsGbPAb9XnBFuVS74eBO2nShucx0pLW3gw6ks=;
 b=AJ7g3vJBLsPpfXIXxMpTdDkTl3mgULzVVOEvr2I6m/SqKaChl7oJqEAfSe+NUECqPnuwWYHauq3+oN4plJPeKSjBYEULUlfhLUlzmOp5a6oqx66PDB3BAPSVrTY+LJ7FIyKZTfBhZ+aYccvyr26SbXJnFSRxCB0P9MzbKJj4501UG609VTNQEjpX71vXYglFPe4jcZ4wEtC+w+Y51JWZ/NsAUIZ779RYvELFfa/tU8kkH5NZecxvq68rbTVW36bdvNIqBc3fqwsyjf/p8aZWXxwoeStnpjdwBKXs6hO1Oo3rDsmw8U0BkdV/sdTpde+CjfDvfhtAMX1Kcyaei73T8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOBIEYlsGbPAb9XnBFuVS74eBO2nShucx0pLW3gw6ks=;
 b=SXlQqwWUClms5ZmBkEgLfjb6tYupTTGeQR1SylQrRy1Vqf2TSKrbTn64ToJkhsaYV4Ur/ruLem++vUab0IVs7UWMR0v4JBHBK8tBvb8Gc3tjsWqn5yTFrVYc8/mRSh+w37u1ofN5F9PXY75YXXcLSNMV9N5Bov58iOgpeN/CoTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 23 Dec
 2021 15:53:28 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::e492:c86b:9906:1b46%7]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 15:53:28 +0000
Message-ID: <5bc5dd90-fbf7-e999-8024-1269eeb78b93@amd.com>
Date: Thu, 23 Dec 2021 10:53:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/amd/display: fix dereference before NULL check
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
References: <20211216181443.38155-1-jose.exposito89@gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20211216181443.38155-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02f39b6e-1299-4262-e02a-08d9c62c5c40
X-MS-TrafficTypeDiagnostic: CO6PR12MB5492:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB54924FC55B18C6ACCF976B378C7E9@CO6PR12MB5492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qigGkhnQT7oGGDe3Sllvw/HM4wC0ghh17PsgPJYpqoBorY3PBRv6GhIYfaosq6tbC1YVYw5pqQoG3Q1GJQtXU7sTAbC+Gif1Vj9mU48oQ7FvMqFSpvShkTHV9NdsJSfpCdCHwuTobIEpb5gz8bc7P+bD/hQB6kcWsmQMOTdqEkPoIIOGc/L2rGLjVKUtqr/m1MDSTd9jteL0Hup3I/1m7hDrKQrvOnZ0NTIVB4zhP5Cv5Y0byWh5NxareQ5cH4j0CMxnyxjGu62uJOeb9FeFegR+P0OJQdUEL1Y8cF90bEMFK6EV0WGFQtUc/WWS7uQ4T0OIbYJnlPTfxWng8csrN2FlZUPS4viihG04HuYDBMnS50beLaZ/kBinzS2c1X0FKqhwaXgfgY4YVtvomLu3jaBYtBoeZY1vSUxlJOsquoln0IqWt3ht/C4tjBOcxJQ7R5uL1KfY2Eac1AWCj909WtzVY0XDRsHHTvr/Xyce5PZBIaIy5H+KUwqMaSs3v77qWPnXgAp2+LahdqV+af1PDow3gWTHatRqeJaa/3l/uGJcl21i3mRjMpOFgwhfYB+VyvZPGmhJjnOqXA98bwU8KBqyag9bNVhib5+SkDe+lAefFnNHwX+sNFn9RCVQaEQjF++R8tHxnJ8FJMH+AnVepbGIFvs2pkJN4dGDg9wsmGoA0yk19K1o89MCb2fGelLaCxXtodfMnnyXSsYnmU1AsypkOylSbKWNyJolaMV/Yys1BD/FXtNH2cfB9LPzihML
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66946007)(508600001)(186003)(6512007)(36756003)(2616005)(44832011)(5660300002)(6666004)(8936002)(66476007)(6486002)(8676002)(53546011)(31686004)(6506007)(66574015)(4326008)(38100700002)(2906002)(86362001)(4001150100001)(26005)(31696002)(66556008)(83380400001)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlRrY25CdGV6dU1XZmlucXB2ZTdEVTArK2xQM1lIQm5vbXdRVHIxVnY4cjhK?=
 =?utf-8?B?MGFtTk16T25vTmtDK3prMUZENVFYaEdSemVXSm4rZktOL2o2NjVtTFp4Zkg3?=
 =?utf-8?B?MGZyMGF2cWpqT0docUFLRnppV0w0ZDdJWkFvUzQ4ZUZOQW56Y3hHVXVQUkxN?=
 =?utf-8?B?akpMWUt6VW9PUjhrR1F4Z1NGc05qMWlwQzVEZ09nRDVqSExlUVY2UWcrM0FM?=
 =?utf-8?B?dTgyR0tIaGdhMm95ZFE2VVF1dWFJdU44cXNJNURyNGt4QzRUUUxHeElIZTBZ?=
 =?utf-8?B?a1NZVHBOR1U4WE8yWVFRN0ZBekN5SzF4RGozTjBBaFRYazIyamNXckI5cW5V?=
 =?utf-8?B?dGptdXY1SkoyR2p6UENoMDUvRG9QN0p4a3N0ckFJU0t1MWRUSEVmZ1Zkc3Vr?=
 =?utf-8?B?N05pbk1pTDZ3bHQyZTNYTllkUUhMV05uYXVyN3hXZElkakQxbmZ4TUo3V1Zp?=
 =?utf-8?B?QVVsMTc5VjFlZ1htSXRzUG92ZWRoTTZXa0I2akVCdk1iMWhDalhuVDNoL01W?=
 =?utf-8?B?ZjdCMkEraVJzWE9MTDM0OFBZYlJuMG5WaXRVWXlFMHptc1BHdTZJTkp5by9M?=
 =?utf-8?B?RS9DaTJkKzQzbVNDRlZmdmJ2Q2VpbUdFVWd4aDY2UkVJbmc4T2JrdVdnQ3B0?=
 =?utf-8?B?cXAzR0M0RHMxNVAyWEZEaURWUTlwUG1mRXZVUUp3eTBQWVVjbEs4OTREMENt?=
 =?utf-8?B?WXBRWHZmTi8vdmNIcktsczIwNDFrQUw4L0taeFhQTDdDMk9xOEhmN1EwNWJm?=
 =?utf-8?B?c3YxSmp2NHNjZE5CYWtFUjhYMnFjc3cwdElMSE9yRGl1c21HZTRWOFhTYnk0?=
 =?utf-8?B?dVpva0FlSlMvZTRrMnh5Zi9KcGRScUJmOExSVzF5WlBNeXNWeGkzWVpJNndt?=
 =?utf-8?B?QlVGTC8vcjhweS9Sc3RFcEIzMlhqNkxJOGdYSDhKc25Lb3libFFWaDJmZXAr?=
 =?utf-8?B?cEF1d3E0NkQ2dU9JRldNMDVrMlJlRG9TLy9vODBwdkNIRjVKc3I4NGNtU1lo?=
 =?utf-8?B?ZElEQVlLOUZKMjBhbzZQMDdFSmEvdCtMT21VOUNWZjNhcVQycW9CRytQd0ts?=
 =?utf-8?B?ei9QUUphRG5ubTBLeWpHS1lQQUh0SDRhTUhpaDk2SkViUXk5VW4zK1FwUEpZ?=
 =?utf-8?B?M1EwcGhkN2NZQ09YTmN1TUd3blhGODB4elJvL000NkRMQWFRMW1GVE9WcmpV?=
 =?utf-8?B?SGduU2xGN0pEVTREcEt0akJ2T3pTNFpDRW1LSndDZUYzZUpmVmpxVkUyZlE4?=
 =?utf-8?B?TzBtZDB3bGE2djcreElzVWh5b3VjUlBpTWJCd0RIcXBneDIxOFhjR05GUmox?=
 =?utf-8?B?cVViSFdjV1l0WUdRd0tRM2JQYkVGeEJIMkZ2aHNUdlBCd2Jqa21WbWF4S0F1?=
 =?utf-8?B?NGpnTFFXb3FSRnk0VkN6c282cjNyQlZJRlJUVVg0SGh3eWRMZFhKaHJwcjgx?=
 =?utf-8?B?WUtyaVBvOHBXU1BRL3ZVVm00TC9HUVN1SEtiSmZwamRuWXlmV0JQb2g2M0xC?=
 =?utf-8?B?bnhFZVRidkNoc09rczF2OEF5STFSSTBDWXJndUhFY0ZLdnFQTmc2ZTQ2Tlpi?=
 =?utf-8?B?aVo3bnBzU2ZXTytsRWpLUmh0SDhIUnR2L21rTUxicVVPV281aXRDQ3RUckxw?=
 =?utf-8?B?VUJ6MEpyd1Z0SHlVL2xTQmpHcHNVcmVaQUlhT3VPc0NlaDdwNCtDV3FJUTZI?=
 =?utf-8?B?YUVzdVpqbnJsMzJ4RU1TcnJDSWlQc3dVdHZUWTJXaGRiUnhWdVF1UVpWRGQz?=
 =?utf-8?B?VzArNXNqUkNLUGw5VUpFUnN0aEt3MVM3SU9CUFQxZTRhOUpKc1ZIZDc3U1l2?=
 =?utf-8?B?Q2ZPcExhYWdjd0k4UFMyVTdBQUl5d2J5UGlBTTBxb2lnNnd6a005dUdTTm9m?=
 =?utf-8?B?YVJkeERBdUJsY1FBaFJRK0V1TkZYYUdLejh3VUxsY0ZqMXVhQlQ4MytqaDli?=
 =?utf-8?B?SGdiZGd5aytKTU9xTGVUUTVoS3JCWXpUbUg1Tmk3cmtjMWJ3UWRwY3JWR1NN?=
 =?utf-8?B?S0NYeFovelBlb3lhZTRGa3UwVytLNWVMZVAvMVFBS2NsTURiSGRORGViWlVz?=
 =?utf-8?B?V0d0MSs0dkNZOVY3N0QzRmpYT3ZwTmN5STFzUTB5c21WeHRubm9sTDVjUXA2?=
 =?utf-8?B?cGZCVHpYMHNwWUNvdHlpem1Rb3BoRjdxZFh2ZlliNEZqY2dRdWJOMkZzYk9G?=
 =?utf-8?Q?wO4Z1nstTJ37pFjWpMJfEfg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f39b6e-1299-4262-e02a-08d9c62c5c40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 15:53:28.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vg/Y9GrEtrEgrwL8SQuavrdDhkBCqi78Knreia5tdJB7l1txSSm2HiMK2RRj6pXm7M3BYER+Ntk+X9s2FfTw3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
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
Cc: charlene.liu@amd.com, sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-16 13:14, José Expósito wrote:
> The "plane_state" pointer was access before checking if it was NULL.
> 
> Avoid a possible NULL pointer dereference by accessing the plane
> address after the check.
> 
> Addresses-Coverity-ID: 1474582 ("Dereference before null check")
> Fixes: 3f68c01be9a22 ("drm/amd/display: add cyan_skillfish display support")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> index cfd09b3f705e..fe22530242d2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> @@ -134,11 +134,12 @@ void dcn201_update_plane_addr(const struct dc *dc, struct pipe_ctx *pipe_ctx)
>  	PHYSICAL_ADDRESS_LOC addr;
>  	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
>  	struct dce_hwseq *hws = dc->hwseq;
> -	struct dc_plane_address uma = plane_state->address;
> +	struct dc_plane_address uma;
>  
>  	if (plane_state == NULL)
>  		return;
>  
> +	uma = plane_state->address;
>  	addr_patched = patch_address_for_sbs_tb_stereo(pipe_ctx, &addr);
>  
>  	plane_address_in_gpu_space_to_uma(hws, &uma);
