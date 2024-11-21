Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9C9D5612
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 00:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD0510EA75;
	Thu, 21 Nov 2024 23:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PM6mr+vv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721BD10E106;
 Thu, 21 Nov 2024 23:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YX/Ml0NsWGpNi9EPAbQhyBKiA+rijKBtZjscKyZEwBiCtXrm3nB/Hj+Wemi2ovwx2VX1sBASWYjIP3unhk899rn4qOwUrn2NfeIR9griP1flMPXwC2VmTDUjLLdR9DZ6qH19mpBMlUPShARpwoAEK+l/FigUXkjbmFnEp9l5Z6BGNNOSiTlAIgzdaDseMrgfCnRndi1JqTXUNQOrGm8tyuDBveGJwfBnD2hW//zY9nhio64UxqGYgd5zTWB6P0sI7YjoD3IeBCQw6YCTcPeEm0fI95JqGSOlGiygZ6dFVXtUZSlIzA29yJKgfbG+8rPBmNlmRHo7EOXiO6hB5B3hKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V2PfipzaQlfOpiouFQSYhIEtsUJMv5JzDe7MpTC6P0=;
 b=RnhsaTMZE2fttPxYK6sWj+Xp4Ji5LTZyMv6Tni6MSSC2eogRqpSbi1geS54Lo6SgBx18JmtyYZZoKj/QGivaSvlW8i5WRAhIkP7LyIkqT4H3ITOvz4tvS0w5nPaPhuQQ4Jk63pttsBg93ufq9W3nbxLHeJpJVz82KepUo1ZEXsKrBVwsTqGxUDVD+hFTcH52E9dYhDZzH+cTxSw94I034J7ONqk9oTuVRsmwqpP49yzKNMOKvmY6GfONq6fDM2hp6eStyMN9rTAipNh0zUpV3OrK5A3FejPoWXOP4qhyU76rubRK3wvppAN/9Gulb9c1PBvWV6h7n33aC1iyP71ycQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6V2PfipzaQlfOpiouFQSYhIEtsUJMv5JzDe7MpTC6P0=;
 b=PM6mr+vvrD0uHpTo2Jdq8WOOjE1RZva/u4B07+46/mLOjm8w/S5eNOO842dU516zrZL9scPmNhspBwvhZZr2Mfhp/kjrryp54nClia1X+EmdSJvMnTTo2ceO2yV6ZwYUK/eJ96l7TaK7u9oehFUrFRj9sHh/N+Xv0yz6MVdxJow=
Received: from IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 23:10:55 +0000
Received: from IA1PR12MB9063.namprd12.prod.outlook.com
 ([fe80::2eee:d305:3a90:7a86]) by IA1PR12MB9063.namprd12.prod.outlook.com
 ([fe80::2eee:d305:3a90:7a86%5]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 23:10:55 +0000
From: "Zuo, Jerry" <Jerry.Zuo@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "jani.nikula@intel.com"
 <jani.nikula@intel.com>, "imre.deak@intel.com" <imre.deak@intel.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: RE: [PATCH v4 0/2] Refactor MST DSC Determination Policy
Thread-Topic: [PATCH v4 0/2] Refactor MST DSC Determination Policy
Thread-Index: AQHbMgYAYw12AKm2TkSOPSM0Ea90erLCQSow
Date: Thu, 21 Nov 2024 23:10:55 +0000
Message-ID: <IA1PR12MB90631D65960DEFFCE3CFD4C0E5222@IA1PR12MB9063.namprd12.prod.outlook.com>
References: <20241108174439.141418-1-Jerry.Zuo@amd.com>
In-Reply-To: <20241108174439.141418-1-Jerry.Zuo@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=4b4601a0-44cc-45ab-aad4-c5cacac37f9a;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-11-21T20:19:02Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB9063:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 72ce8694-46e7-4c6e-c8e3-08dd0a81c0b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?dqONQEQaX33pQkUVj255jVp2Z4WCwJ9EpBRkcT3C1DMnVY1xCw3hiAWyxLsl?=
 =?us-ascii?Q?ebMEtB00V7joEAOTeOnHV0I6dnoeBcNIgZUzjcdcVJR5rkS17tpkYVlb08KV?=
 =?us-ascii?Q?LxCBQ+JKINlxWgJb2fgOJsIL0GFaMAie4zWyXm0c7Dn+m/zxMyaUAupenwbF?=
 =?us-ascii?Q?qcGQeRG1ehlkipt3/Q2DYBPoSG+BVwbE9EMY/8zn+/X50hdG7lGM+/5Ay6us?=
 =?us-ascii?Q?X0Se7unKuiXlvUB0AwdIt406UO/04LKQYMYtnJex76g6tKQciqyo01yaJx5S?=
 =?us-ascii?Q?Im2BThhJGsILggPGOzJNHLk9LMhmsUVHUVAsfjy9WsbYjFwBkOynw6zHcAKd?=
 =?us-ascii?Q?nupWx6NnSkoXbuiV+itwrsocNLxe4ioUrH01nXR3Hb0IQGw7tjtXC4OnFv5l?=
 =?us-ascii?Q?m4kuhb+FrU+nYVdjCPbBKRDZJCvzYocn93culue8vLWZHqeUdv02/+iglk+i?=
 =?us-ascii?Q?tohlZx3LE7G1POYQws+/Y9mA5dmdXkWiiiENh2KgIBR2626ua6qxdqZu+7Nh?=
 =?us-ascii?Q?m1AiuAgxzYooqbwLnDJsiW/DnDwztDpQAz2sBs+BU/Y8hpsas8P28Fu4cwGa?=
 =?us-ascii?Q?AgSmNprVMGKLBtWe8ysqOIp9qgRQb9KydpFol1sPeAuzYuJUeVgtHuyzSVFH?=
 =?us-ascii?Q?cLgFGN5LXPT+qRBZEwlWtBW3GiBbBMSh12fj6Wta+NXGCPpD7h7bZ3Xh8izT?=
 =?us-ascii?Q?hjcRzwzaH/5IRW4HYrV9W9+barb5UEYpQ/RgkWHF1W32H3KUwPv+diwuhg+J?=
 =?us-ascii?Q?LnxWklxSYfOjbn17U5l0TTcKb4/TZvQFG+vlWm9F8McaVvic9M0eReZsYHOV?=
 =?us-ascii?Q?bzuJjtfIL5ew/JrFVQXqbD7E2259Wnjw98dHFUH2C3mgsG2xErKDEtYFd09j?=
 =?us-ascii?Q?I5Nk+PTC+MW/0CtOBc3ihgAYjH7hcIkY+NzdjrRRdynZFJxRtuq6hfzIsOUE?=
 =?us-ascii?Q?oxMPvJWOTD9D5NXjLeUhU9G7NlUaaRquQvb6c+xPEAsbChdWrL4TEFlsmAwB?=
 =?us-ascii?Q?H/q48TVUW4pBi9+j34nKAgQ1mWa7XhBAfOqiY2++x0qAVHRo4jWsqn9qZ085?=
 =?us-ascii?Q?6J/DSGjyltdPj1sY9JeA25LMpVr3IvGFB1cVA1iA/onfVLMyxxMf2VwGlH7/?=
 =?us-ascii?Q?b7g/PG5ncvn8RbTSmNbVzU2TVsHMQWAVuNWC1zASCFrwne+IjsUnRlGGmlV0?=
 =?us-ascii?Q?rttZ2duvI4tnCEN9k2mH9kXKPkDjXlSneb6qjoW2vnTN6BGbeLZEwb5K+8iJ?=
 =?us-ascii?Q?adnnUVQ7ohggKE7AvOQSe/giS7G/6AEAUvKAwldyIVpDEun34vmPEiVr4yNq?=
 =?us-ascii?Q?89URHg5sV+FMmI79cTFtYyfKagUze9uRfQxWk3VyVwCVK7FgWqFmpB582u7P?=
 =?us-ascii?Q?YVLFW9k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB9063.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2HLV3+Nhsi/XK5FyC2oOKBJbTLsLIKaSjcGZZZPKyibaz42oHXz4DQp4oa3x?=
 =?us-ascii?Q?GH9oIxxRIgpHLYbiAw9CniQGQWY7l2o6W8BSSjmPRezoEt3faN9ccqxbMqa2?=
 =?us-ascii?Q?qDovTCL9jfas5wQo9YWxCgqknXZNwmk1MBnwzzUlUfgOvP3Y++EdX9+6jMWN?=
 =?us-ascii?Q?CCVyFCBzsrkXVsGLmk3KeH0MhDXFW7I+rOqN7JKiDc0yBlEXIVPnC3PSGYP5?=
 =?us-ascii?Q?5Sgv/juJl8WYYeij5RVeJz/6qvkUWJFDXEp9BZDRid8HEYL3QcbobTl8WFWK?=
 =?us-ascii?Q?elLQsizpxYNT4UreVWXVfZed1OG79V3lRD0hQB2liPNPyxQPRVIiNbFnMoG8?=
 =?us-ascii?Q?XlchxDTT2G48/QhVKbdR3nK7AAULqrZfnzje//d2BWYPzDEq6NQBO0+Igd++?=
 =?us-ascii?Q?fxYgDWETVsac0ex76P7pcHScC22ZBaL8AiVAbe3+Ek/vSXI+p4kdmgB95q2X?=
 =?us-ascii?Q?g64ymE8z5pQR/rr7Zk7Sf46Fs134Swsf6KoVQY7J7nvO4wWCnbJHAcclk+yt?=
 =?us-ascii?Q?qYSQucZ1VTiZJMxhxujMy8fMCgdxvwWLNqrBn0jvbzzSWB/SoB+V3sfKnxuv?=
 =?us-ascii?Q?V8IgomR2JApB8tjc1Ck/hE64zs7NOMV+uqj7CsTXklEDgcio1vbjeRKhBdo5?=
 =?us-ascii?Q?SZ7s4ea3TNP5AS+7LaRc1YHWHFUq+/62PN77vHz0ymCIn+bNS6UtR05n/K6r?=
 =?us-ascii?Q?E9GKzuiWYr9zbnvECrOY1ap793Ck6jPb8pUY2nWsEXBp/okTzqosYdgycL/b?=
 =?us-ascii?Q?8QXrDgcumdOu2gZIuKu/ZYL28fuCvwP4t4aeLZZLT5JJDRAa0xJwp4N7lVNg?=
 =?us-ascii?Q?KDQoJ1PFYzIdxo9rXM2Eusf8wasSHXNL/z5zbczcM+8ipMU+gmoCTkPaUsie?=
 =?us-ascii?Q?i3tIZ5sKb/eCQ0aPtm3BDkkYd32eF+d5YRTQo1jBE9PQyoJiUTeeL6BkHoOt?=
 =?us-ascii?Q?R+Ov4MCjvaHb62Vl+kHPyiyAJLghETCP3Qh6GXBwvyDh4+weqRzITJRe7hlc?=
 =?us-ascii?Q?P62Z2h4Uy+2qX0G5o762+0rTOSSMR/s7kOw6N3uXZA04v0bs4fKBGI9WdvjE?=
 =?us-ascii?Q?gAUhQXc2+FSfwKugG3+FGzL4ZrGEpblPigevr9bUgMOsU4vHzg2DpFfCmq2l?=
 =?us-ascii?Q?qefr7/yei9dmXnB+DSheBe+IdgniL7RZJryBLULVIuIhKCoSALN1/7V81O1d?=
 =?us-ascii?Q?ZiPECaO6ruR3M5WgBXwunyE6DGVocG5Qh+zFQWjPPhOVF5jK/SyD/42xaCeu?=
 =?us-ascii?Q?sj/2gxE1+2VJ/4fQNStiiH6GG1PZ2zE5o2hwVkd13uslY+OcV4BYYiqOgOVr?=
 =?us-ascii?Q?0ov3rGgUpxbeTWWWsGaQylAs+pMywl3GmwwdMcC8Vh2TS8HP3UqrkbeJEHPZ?=
 =?us-ascii?Q?AayN6PsC+Ndl9SNuCP3xVAU0giwaZHK1fjBW+iuHBMoDyBRxiZieSUbLHWwM?=
 =?us-ascii?Q?brXEGJVF1Q/Zb7fW+8KThgY0gjV/bKkvtf5+bi7qCI6xaL6NUDeBjyMcH2PN?=
 =?us-ascii?Q?b0E1gQP6+vreU78Kh+PRNli5u01a5sbFZALg+4vRJKJZwzc5TIBV0WBsH7SS?=
 =?us-ascii?Q?10jnEnTecuJ+Svpp35g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB9063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ce8694-46e7-4c6e-c8e3-08dd0a81c0b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 23:10:55.6182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wv5AMX2s7SA0u9uTGMcNU0iDftUVYKtyuhN1kSb/j4oKrKiKjRWlHERNDvFZMsf1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
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

Hi Lyude, Jani, Imre, Simona:

     Please kindly review the patch series at your convenient time. Thanks.

Regards,
Jerry

> -----Original Message-----
> From: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Sent: Friday, November 8, 2024 12:42 PM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; intel=
-
> gfx@lists.freedesktop.org; lyude@redhat.com; jani.nikula@intel.com;
> imre.deak@intel.com; simona@ffwll.ch; Lin, Wayne <Wayne.Lin@amd.com>
> Cc: Wentland, Harry <Harry.Wentland@amd.com>; Siqueira, Rodrigo
> <Rodrigo.Siqueira@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>
> Subject: [PATCH v4 0/2] Refactor MST DSC Determination Policy
>
> The patch series is to refactor existing dsc determination policy for dsc
> decompression and dsc passthrough given a mst output port.
>
> Original routine was written based on different peer device types which i=
s not
> accurate and shows difficulty when expanding support of products that do =
not fully
> comply with DP specs.
>
> To make the routine more accurate and generic, the series includes below =
changes:
> 1. Refactor MST DSC determination policy solely based on
>    topology connection status and dsc dpcd capability info.
> 2. Dependency changes required for each vendor due to interface change.
>
> v2: split original single patch into two
> v3: rebase against the latest code
> v4: fix a ci issue
>
> Fangzhi Zuo (2):
>   drm/display/dsc: Refactor DRM MST DSC Determination Policy
>   drm/display/dsc: MST DSC Interface Change
>
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |   2 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  20 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  28 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 261 ++++++++----------
>  drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
>  include/drm/display/drm_dp_mst_helper.h       |   9 +-
>  7 files changed, 147 insertions(+), 178 deletions(-)
>
> --
> 2.43.0

