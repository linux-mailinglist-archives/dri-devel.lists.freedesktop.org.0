Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80EF9889B7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 19:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6730910E1C9;
	Fri, 27 Sep 2024 17:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F5IbLeF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B13310E1C9;
 Fri, 27 Sep 2024 17:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPNA/NVaV6mDpp5MFJqmsxZqIsX8S6g5DsKzBNABY1oyp8XRo5mV4VfcirWB5Crtxms9ZXIZt2h9r4dWMpVGoVieqeUHZQXozO3/sB4zEU/BUamUrdaobtQ8LiETgHb1t+dgd4d8Git/NjUHN2i8uyAFVeuEkxclks05v9LLT+z7n3pKBErhLtMd3VK2gLLydqKi8yIn6c3ODQqTl57dpIg+U0kquzqosWKzqUqN3mb37EnrlYwxgbARrLVVgygj43m0BRN9D/NRx33AeNDw2SYwGsQA6Jy+FssUCwOwTftCHMG48ZyzP+nPJ5CI/VeTpmN9oMXJq8Zn+PYe9SXEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KUAI1z3oF6I3tF/OeDGZVrdlFONo9VLc0HVgO/eHeQ=;
 b=sAkKEPIIan8kxmxvyeizUg07w2USrs1cUNqpzypt4jE1xv3/I9F+TFXty/eFuP61B8jUh8fMbXEqNSIgdKB+wWjC2R6xxv9LdPeAxBIL4mf/0JvVl+hDrQVN9cTE8UOjoIeKWgzdmKUzo9oHuR8TbJFF1la5XxJCQ9sO1XbVay5mD2giERDfdrNd7kqD29aYLGFQzNxTRv9rIRMpf00C5pEea9Dydd+79wMuCk+XEhScENy4oPHQTyOfgRlA9eqAOscSDo3mvIvun2nnqC7bMzSC7dNO9MiyqJlaD68D0ZJ5DQRWSR6kRL/sJBYsvk5a0Ac35qQPeyrwB1eHBTRMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KUAI1z3oF6I3tF/OeDGZVrdlFONo9VLc0HVgO/eHeQ=;
 b=F5IbLeF8eQ/TUeHn89sys4Z3YvExF8oF05rFPHL/ER+iLwtlk+QoGN/2QYGpJpRYLWiDuEZmgopNKCaBmfS1sOY27k8gH2DW9MiG4KRQ5W+u7U4RT+HLzNfXAYD1kVzkgdLY7QmFy2z4h/kykPtyON/okRpqVSzW2YRw2iBFZjA=
Received: from CY8PR12MB7289.namprd12.prod.outlook.com (2603:10b6:930:56::12)
 by IA0PR12MB8327.namprd12.prod.outlook.com (2603:10b6:208:40e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Fri, 27 Sep
 2024 17:40:22 +0000
Received: from CY8PR12MB7289.namprd12.prod.outlook.com
 ([fe80::9cc2:b7be:be33:58b7]) by CY8PR12MB7289.namprd12.prod.outlook.com
 ([fe80::9cc2:b7be:be33:58b7%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 17:40:22 +0000
From: "Mohamed, Zaeem" <Zaeem.Mohamed@amd.com>
To: Melissa Wen <mwen@igalia.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amd/display: increase max surfaces in line with
 planes and streams
Thread-Topic: [PATCH 1/2] drm/amd/display: increase max surfaces in line with
 planes and streams
Thread-Index: AQJbdzj5ttBrhthVEY8pRJyd9bB69QH9Y7zTsVst7rA=
Date: Fri, 27 Sep 2024 17:40:22 +0000
Message-ID: <CY8PR12MB72895C3AF14118F815B9811BE26B2@CY8PR12MB7289.namprd12.prod.outlook.com>
References: <20240925154324.348774-1-mwen@igalia.com>
 <20240925154324.348774-2-mwen@igalia.com>
In-Reply-To: <20240925154324.348774-2-mwen@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=f3a435a4-f626-4719-898c-d2ae43db71fe;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-09-27T17:36:12Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7289:EE_|IA0PR12MB8327:EE_
x-ms-office365-filtering-correlation-id: 505f3a27-71cc-492d-e6ae-08dcdf1b7692
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?c2Lt/qshSOGkfS02rj/Pm36im6Uh0RwFkCWX7b5j4/7Z0ZLDiuiRLxr3QXBL?=
 =?us-ascii?Q?9zq5sle+j4MkPRolHVpeSuSpSvHF2a3CV8zGE32Rk+B9OMQyMTIoTrbLSaOy?=
 =?us-ascii?Q?cBzoW/bAk33STLgZbWAQdO5HfHUVgJM9REUO+pHKRdgZ+j89uWr47HL2Nvsu?=
 =?us-ascii?Q?iD5j80puk77K9GBDBEjR1S0EmZOOckMIhQOmHNwxuJaiEVbS6lZ7SPWN/8Lk?=
 =?us-ascii?Q?CUlw1fFqldNetEslmGzV/tsnUUVSuVM3/Elp5v0CmPVt6CQNFZjibDo2sneW?=
 =?us-ascii?Q?uFWNUIrK/0Oh08amb/2dwlxxwMjnZZP+9fBsFP/OLK0bkjdS6/2XDRMIvKdn?=
 =?us-ascii?Q?qWLFRwp5LsjZt2l90k725mOj+rCKM4muG0GTR+ahcjhMlXQRyGtK0mBdoC5t?=
 =?us-ascii?Q?pH/922nJ1i/MXLSUXQ0lIMEYlf12vaDAIBoldeXjEAQwJ15cQacXE1cP8lbv?=
 =?us-ascii?Q?s891yzuOnP9NCBg6gD1pqj33KyyungLerk2wH153NKHzMWI8j2igaYa9Va28?=
 =?us-ascii?Q?7ARRs5ubdf5iSqCdS7Lx0TW5U3MJFR87J2u/OpnDq8NMrwr0xDeLM1395tqW?=
 =?us-ascii?Q?yAGlZdyHEMmfJNqcOGs+4eO6KVCu9XKGg2Y0j4hwer7wscxt45LwZkScCKZN?=
 =?us-ascii?Q?Z2h/utuvNj2g064f8sRenWbAvsCUQWXvq5xe16GAuK6CtVoj6odtE9kJxm3H?=
 =?us-ascii?Q?ZIdQ4dVqyTpU9Cgjh+JEnDOn0h6aE5yKhX+GsdpVsnu7wbnkXAfWMzVugEfr?=
 =?us-ascii?Q?CkHMog6Gbp/25WSSPQmdI1NtmgHiHRQzCCfhrjdmB0iJBzvNRje1TLOybSyt?=
 =?us-ascii?Q?iJsg/o1zRd90r/fh9ns4RhSV0Ell0efynmc5uEO1qAGCPY2epRonfqktf+1D?=
 =?us-ascii?Q?3YYWt2su+ux5LkJof0qZLpgMAHWxWPcCWG0NayxThFJQHGqTbl5Bb/ATjUBx?=
 =?us-ascii?Q?c8xNpIXZmZZ4vxDmXUQtgFTyskDI9E2wEVB7UsmvY7NSJz7uM4gJmuZK8vwF?=
 =?us-ascii?Q?DY852DQNnOmU9KG+H3s3GSIz2jAm0TVQsbJJ/lyc5pcp6PRN+IUCcKioVyTy?=
 =?us-ascii?Q?PDuFlzDjvSAXgrIj/qUMXHOUpnz5hpFtRfIFKpg23WrY0TlPNMp8O0WHZcLe?=
 =?us-ascii?Q?a3ihGg4rDD+INEkpdaM5aheuFycuc036ZQAyyAOUKevFvMHW0dXALJAiULL8?=
 =?us-ascii?Q?quplbtTDurT4sZTXjhgtbLkB6/gn91yBQ027Y84xKdQs4z0cSMkiMha63jFZ?=
 =?us-ascii?Q?uLFeaHyQ97XMEvGxe+/N6B07GWe0Yu/J9Oxjk/vyx4kpBjph543jprQP7S4R?=
 =?us-ascii?Q?O82C2/c9dS8xlTzG4Cx1nG4oKdlaE1lUSHBa/grPwN4vu4Lq8iOkQJ4Bh9y/?=
 =?us-ascii?Q?6WLkeUM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7289.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(921020)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DUAcJho6mB7XY7yei4JBdmu3tYus1GNBdB4DxIv98ibsr6r/XaUcAs3QIOB/?=
 =?us-ascii?Q?NPHVuanvfhngMIpCUjZ2BjW0mZvNY/9gQhw4Wsvi3OngXq23Zm6uGpuOYqLM?=
 =?us-ascii?Q?yOwzysiBgSXlNMTDq/kNr6inVDvrDhhRyXmEJKh9uREVBWlS2LmWkHnGZQu/?=
 =?us-ascii?Q?Zwv4EKNkuU6uFCHhEdBsBuOSMTQbjkYRNKJRyv6miGmBiDL5DAPJnzaHY3wa?=
 =?us-ascii?Q?DqCZT5dOpYvka4DmBhnNAzH5lIIj9o8DsseWpA/nWKXyjEydviuV8GSl/Zf5?=
 =?us-ascii?Q?hvE6z4b92gioD/tAGVO2R8BfTbGo76vWFeU/NCZcQcCTz47FgQP+NZV0y3g1?=
 =?us-ascii?Q?0HXfP6yXcr9VqZfTEcQ7Su65KOqDjDV7PhuGVZUOQoglKDG5pdGh1CCY7q2o?=
 =?us-ascii?Q?XDKFs19aRItX/VSviuqC0ArO6SGHJ5yTp4NbzhprQn0JWHVD+R1jmf+LXugP?=
 =?us-ascii?Q?cjzpCHo2V1Tr4Yw+Me4OjeOfnxk6n7CWv6XEJ/BX2k9s1sEdZvq2CBcmNMZM?=
 =?us-ascii?Q?rUC3rZ2MgAwkPgix3d5urD/Gt1QENbbS9qifOu8V1YLqazUflocuuRuwyY8v?=
 =?us-ascii?Q?xcBX50YeMmQpIMRtT1Molcz5JU7BhOz2qmYPQl/ZF8KIHFKUBMyOoJRW5A+i?=
 =?us-ascii?Q?ZK/TmESjXr9YODqk+5LZHyMs3/h9GLRLZGzm2UX3xb6IeIXy64OLYtzNF4+c?=
 =?us-ascii?Q?Y0Nonj91V+A/1zfxugKLlYndGJHwVkYyMXe5xhX3JsfwU8Wl8A5NESaco/nH?=
 =?us-ascii?Q?oxrAzSh+V14aN4cEYbEY0uZVcc27XrHDqdctaCGul310PguP57XoWXK8+hwR?=
 =?us-ascii?Q?U22VJyRM1pXOMwcuw0oaxPHy2akkGuNIEryA6zqFnKFqSmBsRRxB27OWvc4P?=
 =?us-ascii?Q?RXGMTJ4vv8OXAxQt9barpBfJlHm9KEEC7AgU7i3zOrqzCHmQERwiqpXB2M6D?=
 =?us-ascii?Q?I8s4Zz3wvFeKVcl6SEa4gdA6rbEV7U4W3+qSraRFwPFNUgXyv+a8HUwMfqlt?=
 =?us-ascii?Q?EumhHCTvix61OojqjGGq2DlbcBqm3nP2Ze6HEuLOYcNdqvtPSUWlrvlc4yA+?=
 =?us-ascii?Q?MttsfUZ9Bia/R073sp1p7JKTtFEax7SfKrYERCfUH8WzutHMvnTfvYZ9bETK?=
 =?us-ascii?Q?G1eI5/5jO7Kj6EpUfvcVnYitpZCNlQjzc48R+YPSDlO39n/qt6dH5XHxpQMC?=
 =?us-ascii?Q?xLwLRzl1ipeaKEsCLvpOhy1Isfj5eojpf9+RcWIxB4PCsNgbSnF0J2VzyYnf?=
 =?us-ascii?Q?QiZ50w9W1zJiitjZe3DtJ4dA3Vo/iy0jyrQhHTBFTx/zbY4pdwEccIbMr7Yk?=
 =?us-ascii?Q?cVsB7lFiPImD+lgvsLeRVrP68VtLs1SxeI9NJNJiXPnmYA8vC0tDsl5gzEje?=
 =?us-ascii?Q?GK+xgEPpzGxkUvFQM6aLuRWIpoYuLon4YwOz2W8rtNQNuOCoyWOyT86L/q1W?=
 =?us-ascii?Q?0Ktue10NaYYNY3i6b+KmlmeSmNaDek5QF8+g5ccg2h88aKtMkAe58eb00KZo?=
 =?us-ascii?Q?G4QSXlhX7PwyvrduEf2aPxfNvetyeqo/vnT8p+4fSETvcuWXaTf+74gerSsF?=
 =?us-ascii?Q?FnmiuBhu4dpOvMTOVPE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7289.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505f3a27-71cc-492d-e6ae-08dcdf1b7692
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 17:40:22.1720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fE30lOETViItq74QeipV3GixwiRxrZcd/eSFc2LxQDbBzeyIJ2nUkNhcvGRm8Jt2wHhtrwDTi40NIJhLagRBJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8327
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

Hi Melissa,

MAX_SURFACE_NUM and MAX_PLANES both represent the upper bound of planes tha=
t are supported by HW. It is best to replace MAX_SURFACE_NUM with MAX_PLANE=
S to remove redundancy. MAX_SURFACES is used to represent the upper bound o=
f surfaces that can be piped to a single CRTC. Keep MAX_SURFACES as is to k=
eep stack size down, and replace MAX_SURFACE_NUM with MAX_PLANES.

Thanks,
Zaeem


-----Original Message-----
From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Meli=
ssa Wen
Sent: Wednesday, September 25, 2024 11:37 AM
To: harry.wentland@amd.com; sunpeng.li@amd.com; Rodrigo.Siqueira@amd.com; a=
lexander.deucher@amd.com; christian.koenig@amd.com; Xinhui.Pan@amd.com; air=
lied@gmail.com; daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amd/display: increase max surfaces in line with pl=
anes and streams

091a97e542cf ("drm/amd/display: Fix warning. Set MAX_SURFACES to 3") reduce=
d the max number of surfaces since, at that time, there was no use for more=
. However, HW and driver evolves and there are now driver versions that all=
ow two overlay planes (max_slave_planes). Moreover, commit 3cfd03b79425 ("d=
rm/amd/display: update max streams per surface") states 6 is the max surfac=
es supported asics can have. Therefore, update MAX_SURFACES to match MAX_SU=
RFACE_NUM, MAX_PLANES and MAX_STREAMS.

It also addresses array-index-out-of-bounds reported in the link.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3594
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/disp=
lay/dc/dc.h
index 3992ad73165b..08b00b263533 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -57,7 +57,7 @@ struct dmub_notification;

 #define DC_VER "3.2.301"

-#define MAX_SURFACES 3
+#define MAX_SURFACES 6
 #define MAX_PLANES 6
 #define MAX_STREAMS 6
 #define MIN_VIEWPORT_SIZE 12
--
2.45.2

