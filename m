Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49379262D2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 16:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D026D10E8B3;
	Wed,  3 Jul 2024 14:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WJwEMnxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE1010E875;
 Wed,  3 Jul 2024 14:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8iTXKhs5RJ/aprKjQNiqhd6NfuMC1AmYZRTs0jxBOGGC0LwE5CBGshYErFUnIkK25svcsPW6pvLDu1tyRpCmRowpPvGaIpgXLJAQLyTi1r3nKSid5rBXFLdnFcF6g8PsNmM7XZem+TKCKArVytG5kqtOsWTf1W/7sc06lW5Ee/bZOhv/OFYwir1m7lR7NRHFpZzJTJUkRXwEC5+Ef8JPE2J94iMWdzL05jUTMgayXdo+AKP9X2lA1hCEwo3KdSwycXNemCGC+UUvGk7q7W1FEsSEm1F6lNuFcBAadQxSIYhpCUpfktrbNAQBgz5avEX1CWZWdJepOelUGRo1SSwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mihi0JHukroW9f+CPPHkvFGG0oY7UMRQoRFrP9nibQI=;
 b=TRipx++vMXymNG13x6SEvjqhQAB8UiC1dU4cGgCiR4LZgwqKFrs4FQVNIpS+BhlpjWamegM0yXoneQvyOOBlPCRmHoVmy1MXPQ44dOElQSpw9AWUY6hSUCCPsRdJMywJUW4LDQitAXFrl+wYggOGHEgSuya4acPQfbLaSGqJfaVeWaHL7cqeNb1jNhkHYcBaacKUD/VL+dSBPPx1CMiE7UBO2f9zc23VHpD5dxtDkKVs9OlESOBMnyup18AHzuB2euAf0QQIKpY5f/UpfHT9/H7rPcdpq3ijxHr0LTSqoBwDAVLoRR022YD8LoVMU/C2so0F5qeGjjLLzIqyI3EIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mihi0JHukroW9f+CPPHkvFGG0oY7UMRQoRFrP9nibQI=;
 b=WJwEMnxyX/GseHMIPYxBMvM3dGSJc9uIAsD+7Vz2+O1Pna8UXzXKguykjuOmWxtjlkTY1Nc2jANJazLqKpczKxFLdwRU5hDwkF1VKgWS9UqOSmagkWBU8toa9owaM8Tn2v0SRFI2NeSSpPZ4Qbd1Vbssxz9ObTSlVkxVaGyLEVY=
Received: from BN8PR12MB3348.namprd12.prod.outlook.com (2603:10b6:408:47::29)
 by MW6PR12MB8952.namprd12.prod.outlook.com (2603:10b6:303:246::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.36; Wed, 3 Jul
 2024 14:06:57 +0000
Received: from BN8PR12MB3348.namprd12.prod.outlook.com
 ([fe80::8d0:2246:d1f9:e087]) by BN8PR12MB3348.namprd12.prod.outlook.com
 ([fe80::8d0:2246:d1f9:e087%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 14:06:57 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "lyude@redhat.com" <lyude@redhat.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "imre.deak@intel.com" <imre.deak@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: RE: [PATCH 3/3] drm/amd/display: Solve mst monitors blank out problem
 after resume
Thread-Topic: [PATCH 3/3] drm/amd/display: Solve mst monitors blank out
 problem after resume
Thread-Index: AQHax6W9sQkq5PtsWkmfL5JAHJU0g7HlFOrw
Date: Wed, 3 Jul 2024 14:06:57 +0000
Message-ID: <BN8PR12MB3348F86E259037338B248735E5DD2@BN8PR12MB3348.namprd12.prod.outlook.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
 <20240626084825.878565-4-Wayne.Lin@amd.com>
In-Reply-To: <20240626084825.878565-4-Wayne.Lin@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=79087b0c-aa3c-45a4-8723-a2684d044e16;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-03T14:05:48Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB3348:EE_|MW6PR12MB8952:EE_
x-ms-office365-filtering-correlation-id: bf47b8f1-be98-4526-0b6b-08dc9b696681
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TmyhIB94tsPs5Xg04hucCCG1fZzg8iMMHTkzm9YEUScIL1USc4LVq8uPLwII?=
 =?us-ascii?Q?dExGvtDLo5J6Q3AVtnDmEdAo67mlYGCYBL0GrZl25TolfZAuW8FXuRUBeOza?=
 =?us-ascii?Q?skNfYcJqFrYWh5h7zrMDxVMi4djeh3Clmtr02ucGPXhDhVOBjPDOHrEFSpAk?=
 =?us-ascii?Q?i/6PhdRTfqC0QbN0b5VyfZWIRvjFe6/79pWwPYmHZtn4dESCGyNzqIU84pwx?=
 =?us-ascii?Q?f1+SzqAvZK1gwEe8UdqIS2fElEw31ogS2mo1H6xLb/jhmGIlVxXhY9vJRfsm?=
 =?us-ascii?Q?zD8f4ND7IqiXeoJ90wVvwLXuBX7WpszE0YNrw4oFSMmpERFkDvXZRT2taJ+C?=
 =?us-ascii?Q?2vpR44Pf+1xLy5VN8bD+gwuUZZJdj1j2nOPiu1LvEsxoIdhXiWbZVW51tUzh?=
 =?us-ascii?Q?4XecZjc0m08lMzTh4LB3SgNWZqm1z2mlJS+sPTpaNGy//j79z9LawGymvu20?=
 =?us-ascii?Q?M8y5VMN5pGbAHUuAkON6l1emHKpvCyfA/ioUi1bDW13pZg54x1D8qfOSuL65?=
 =?us-ascii?Q?/ElnzFKipiXM8fliFJ62BLDKgtz+crUOJa5Q4UVZZeLbhNh6H4tfLlkRdmrj?=
 =?us-ascii?Q?MdGs2e4zO8J/NmlD8ahoTuy5dhZrpRUr1azeUispMGn2fGL46FY9gf3GUpo1?=
 =?us-ascii?Q?mEiJdf4kOHUwRlIRm5bZ+XidMRdk1GfIVLdpG6qdiJHrylLCNTTAnNy8T5uE?=
 =?us-ascii?Q?YgGo/YgDNJy6Zo024OTV5Rz53Z2eVmia9aLJjHXvvCY2VuZAHrWtsWtq9zQz?=
 =?us-ascii?Q?1CiYJKu5UwMYu39zlMnNMz2AUs+ysyD1DsIw/ZGw2kUch/b5orJKOcrORbiz?=
 =?us-ascii?Q?BjBf08TZyrK2tte0CipJhXDnqXsrjG6QFRdlRxW+Jx3sU7tNue7PSF6rxrKl?=
 =?us-ascii?Q?d6ShAVf2QqJzFdJPwitxnTSLK5pPM44Z1lzcCj/5+DCNGGxxHfJ4Cvb8CVbQ?=
 =?us-ascii?Q?xCC9uGmKKSrgAsv8s1B0uE7tcOavO46lx5lMRXAUufBBeCsQp+NBNvgXEGAO?=
 =?us-ascii?Q?QjsXXFdxYfkDLUuKVCy1IhACOGinqaFM21yCZh4aTLyqQS8Ru/FI0aceBWvx?=
 =?us-ascii?Q?coR2iw5u861HtHBmkK5zXBHBJGcKPlxrahFIvRzU7F/fydAj9b91xmYYM6Qc?=
 =?us-ascii?Q?UW+lB2eSjw1M9DuO+UFbGUoQJr559bCSE7ytL0LxI1J7YrUzZtLTcNYa+Gvq?=
 =?us-ascii?Q?OcQYz4QshwB3Fr7hyKkr5OQbvIdsfg7SFO86zB4VPl3Tuord1LMVoeMfR2AO?=
 =?us-ascii?Q?UP0qwM+cmDC9AexWjqH1PcA83Vspx3W8lXKRFw1JxJ0wOI1xLw8TrzjP2wSH?=
 =?us-ascii?Q?K3E6YDV3jST0TH6uV8+/4lFHpakL5lN6o0QhpwjJ0GHPmp9kiypxk9z+vcmm?=
 =?us-ascii?Q?I8kzlfy+taNrd2Zle9X3eJqkQagArEVX9bMohTuEe4ZNUID6fQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3348.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DKYH8gYqbSuADBOIVCBISTvNNX9vA9crwHR8bVz+t7PfN6O/qI708gMZuH/P?=
 =?us-ascii?Q?olqWo0CUVklojBkLrof8doG2pAnXPzRo5/sx+QFSPAfFa7uvyUxwRWHrXwCt?=
 =?us-ascii?Q?o2cIEnN+O2HUv+iz1d8GyD9UBWSye3d4MbUCHHvlLuaoW36X35OLTd8jp7y2?=
 =?us-ascii?Q?TT4iAbao2MZyNXmigSGxLD8d0+AGm7STlSNet/DGD13OTCeVZQutAqCuDLpx?=
 =?us-ascii?Q?Q4av3vecub0IwQNRzQJm2S9Pw6KGkFXtuyqfhV5DAY1z3gMV5pu3NeVumce2?=
 =?us-ascii?Q?QoM50Lq8zsZxrHUOcrWWAV8k3abWFEECRiqFEtDj33fX9DeQyLACZ2Z8VU7V?=
 =?us-ascii?Q?0OpaQpRXrnzE4kcYG0Lt2ihFUaMrJaOFa0o4MNcPEoXVFUjItPcfY4GIrnOQ?=
 =?us-ascii?Q?EF7xG4mRFmyTs46NeIy/FVdn4djQYa+4iTDg7czFMs8g9B8OyuPtZRvn//xP?=
 =?us-ascii?Q?WjhAqtlG+TmmhK8RROr/qqTqeipUyJF2MrQZGK1b8CfS+N2Nasei/Rp5IoHg?=
 =?us-ascii?Q?KIzme8uLIEg5JC82cXjYxCnjKLtOMfcQi0ijwp6N/jNfHEx8uERzopmv2uBQ?=
 =?us-ascii?Q?IhhtUSUQTduuoloBx4Ch43eh3i41v93o3Y0DGnAgl87QNJpw8N7ZsCZiZrvY?=
 =?us-ascii?Q?t27D8QcfXHkcw7zG5ej3Ej5HaWgXAaX3YhNqgktllBTxh2y7Vd/TD7Gbq1/P?=
 =?us-ascii?Q?GbDbfQ0f62dhxBeOjVkwtHoqW4g5vtnC3cK0dVQWrCdC+hVy1CUvrrBBCz3U?=
 =?us-ascii?Q?41kFWICozD7sVgs24aLgCOAfKlCR7RU/cwXdUiR2jtqppfC4NJj6Gb0R2WBE?=
 =?us-ascii?Q?WUdLQuuedLu8+vOR+v7jwyzlhASTOYiA0yI6769MUJ/2yC+21zr1tNjul2x/?=
 =?us-ascii?Q?I7NWmxqWinmm6nj3Y+hCV/r4OA+sr3P0VpRRMBte21zH0wcYFFfKtOuuT6Zq?=
 =?us-ascii?Q?YDvgNPTyoGFJ2i9vzy5ObEUT/rs4AHCkW4fG7W/7iNDTYY6M00SoNtYPHSe8?=
 =?us-ascii?Q?xDnFs+2VljSn6lR74DOJeesBoizaT7rJiKB1E+a1QufpByj6e/tDYJmZoon0?=
 =?us-ascii?Q?ESQ0LwGNA7SYNjI/MVP6ZpyFZvcLqhRmRXjw5m66rVvyUlL0OXKNQDaqFzgI?=
 =?us-ascii?Q?AxqeSC8jLdT8kG3yXZvq1D3hZxHnmtJBusySkaNKbRmvYZspDxBgHzSpt1C2?=
 =?us-ascii?Q?B0gVPADCzA7XXZJ56xbpLy6PXwq4/KdON5fo7tfU2HvwrFyKLD6GqZtdaqER?=
 =?us-ascii?Q?ZPruRWp3HvBZHtjd97kmu7oyjb9IhKWz10Yd+S2s34aWWEX9pkzIFEMjs8/L?=
 =?us-ascii?Q?OmEPRqBmR5bMgiAxVQZwyrwIUHV227phKW7ztZNn83gRk3+8xpitkxKRUJ0a?=
 =?us-ascii?Q?jufsLz1lPjfmlmkRbr/gxjdlVTNPey2Isuex84DqF4J3OeHJmZwlJ8Ayv+1b?=
 =?us-ascii?Q?xoXBd6+NgUC+3Sfkw8kI4xbsuPUHUtwIsAvKJmjEocDwq2bdwkHFMgE6ube/?=
 =?us-ascii?Q?urYAc9/Wy1zQRMUEJc50Fy+RUPc6Qv8vMjaoWfj4B1ydPgfhbmTZBDCzmmop?=
 =?us-ascii?Q?3GVMBWEhG4JOHWRCVak=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3348.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf47b8f1-be98-4526-0b6b-08dc9b696681
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 14:06:57.2939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dD67AF46FRMFWO4gOH01U34MQlbwd8eKJK2yP9/YCPCJqqhLBHhOcq/YWFWpsFFK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8952
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - AMD Internal Distribution Only]

Reviewed-by: Fangzhi Zuo <jerry.zuo@amd.com>

> -----Original Message-----
> From: Wayne Lin <Wayne.Lin@amd.com>
> Sent: Wednesday, June 26, 2024 4:48 AM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: lyude@redhat.com; jani.nikula@intel.com; imre.deak@intel.com;
> daniel@ffwll.ch; Wentland, Harry <Harry.Wentland@amd.com>; Zuo, Jerry
> <Jerry.Zuo@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>
> Subject: [PATCH 3/3] drm/amd/display: Solve mst monitors blank out proble=
m
> after resume
>
> [Why]
> In dm resume, we firstly restore dc state and do the mst resume for topol=
ogy
> probing thereafter. If we change dpcd DP_MSTM_CTRL value after LT in mst
> reume, it will cause light up problem on the hub.
>
> [How]
> Revert the commit 202dc359adda ("drm/amd/display: Defer handling mst up
> request in resume"). And adjust the reason to trigger dc_link_detect by
> DETECT_REASON_RESUMEFROMS3S4.
>
> Fixes: 202dc359adda ("drm/amd/display: Defer handling mst up request in
> resume")
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c64cc2378a94..b01452eb0981 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2569,6 +2569,7 @@ static void resume_mst_branch_status(struct
> drm_dp_mst_topology_mgr *mgr)
>
>       ret =3D drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL,
>                                DP_MST_EN |
> +                              DP_UP_REQ_EN |
>                                DP_UPSTREAM_IS_SRC);
>       if (ret < 0) {
>               drm_dbg_kms(mgr->dev, "mst write failed - undocked during
> suspend?\n"); @@ -3171,7 +3172,7 @@ static int dm_resume(void *handle)
>               } else {
>                       mutex_lock(&dm->dc_lock);
>                       dc_exit_ips_for_hw_access(dm->dc);
> -                     dc_link_detect(aconnector->dc_link,
> DETECT_REASON_HPD);
> +                     dc_link_detect(aconnector->dc_link,
> DETECT_REASON_RESUMEFROMS3S4);
>                       mutex_unlock(&dm->dc_lock);
>               }
>
> --
> 2.37.3

