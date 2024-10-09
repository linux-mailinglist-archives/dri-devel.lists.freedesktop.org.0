Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E71C995D34
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 03:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A0310E625;
	Wed,  9 Oct 2024 01:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="K1PvEMFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8905410E625
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 01:44:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVJ4WsU6Ju/KPJy8UQL6g8L4k4UeIOFwwApjKYJ2/EjeMcWi3YWi0peUNWTwtjLNH4D9QEfCvRik3EDadCewWfCdxXaLSNU3UDJaBM2WcdhWHVF7G+867P6mu01saCZWjHqz2Fk70KDeXJXlHjlmkT/eCoocEWrnW29MtiVdWNinYa/1BW3XlysyBAySjGh1RNZcqHnBKRgHYmf2XXN5C6ypgIDs+OctAn67RnywFIkCPtZWhMPyYJ1zxICwXLj7cRndPrxMQUVGKIcRE8vvGV2qKJ5rQs54ExGBYVrfShsNEUCN+5u7OlLgRcu8K044BUxMT6bg5Guzh+LiuviXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2H04ql44TlbQ63U2+vx9o2liCe2iLnQ+O2w05ZYsG4=;
 b=AbiczoZ9TXLpczwimGYvDRvFRO2GSj5vHeb5wTLPp6WpEjsO3zZhs5GnBZD0gsUDxCFU3oUddfDqvH/ngtj3NuLt/xMkYivf8gxXOOaWWuo7fuTcs4COK2L1S+B6NFtj5L8Nf962RiMdxyWH2tqYSWxsoKDvdwkijfclA0SSkg+WlqQQ9j5e5zsgzT+ngoWiRHGwpmYrpcVoBKtiJvJ0GN6tGXDR1Wd5nnaHsamMhVvsJwfK/reES4xucOpj08n5xFrig/ieC1E0AEDmpSukPJeoABIFlUTXy2/0DsrbSeOl22FdTSiCn1Y16pqk+jmayBjfOYaCNIdOZN4tTWoYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2H04ql44TlbQ63U2+vx9o2liCe2iLnQ+O2w05ZYsG4=;
 b=K1PvEMFBCW37EqygtHNlQff0/nRfSusyN/ahzEpL98pulj7GT2UdNT1tHBjv1+XGsy2ByHf7aUm8dGUgxBGw3F1LKA5VTMZYUP9FfSO1CWXBuo+JIRMjtK7cp1kFWfBby+kI3TzW+woxZ+SqtXLJrQdcVuFP8Tr0qLLKcf1wwZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11140.jpnprd01.prod.outlook.com
 (2603:1096:400:3df::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 01:44:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 01:44:54 +0000
Message-ID: <87ttdmrqw9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 2/9] of: property: add of_graph_get_next_port_endpoint()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
In-Reply-To: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Oct 2024 01:44:54 +0000
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11140:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ad3c82-380c-4eef-68f2-08dce803f970
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v2sYrMhSnc75vpP6Ly7YY3gtJcqbK8qLZnn52T1A4uWM1uuSPqJqxU5Um6F/?=
 =?us-ascii?Q?Xh8MWb/9iAOVwMNUBABwPztNXEEzLABjGK6AcXiE2tzUup2Ed/mxZ7kL5KVq?=
 =?us-ascii?Q?+ufvnkSqhBpKklaS1iReEUsLvysmFtn7C9xE5/w06m1q5kM7skPyu4pO/yKW?=
 =?us-ascii?Q?QuIEtcHt/eeMOmmWNqqG05aZs0z3wvEGDXmaWHDjSYWnwWCQgCvOwgDuP408?=
 =?us-ascii?Q?XCPkok43X725kTG7D6LQe3LnDav+NJD/2/gBPwSG45+oeWUZ+QwDSTW85wch?=
 =?us-ascii?Q?JSuEaltVuEUmQBoZIib20zgREzieMeoKub4EAjd8TkUuCdeqVd508TxPWbdx?=
 =?us-ascii?Q?DTERglh3l8pdXkKgEZ/sRvS2E+4hoFLObFwMMO1u8qX75cE8aymKVwMtWn4h?=
 =?us-ascii?Q?CEquDNLvyPBUiWI0IB79eZXyYbHr7M2bu+Lr/R0XR4EqrlgbhfkZbuA8ARp/?=
 =?us-ascii?Q?ioJbPYT7ULvBrX48SmEjSUfGoSo1T0JgWjtbz7T3r8eyR1CCDE+iTCx5InT6?=
 =?us-ascii?Q?HiSazWVbs+YL8mNLBGbtnz0VtL5Lyq10gbdJrnCrzmxX3mfkTCPfE3DP4iOz?=
 =?us-ascii?Q?WUijifaLSfdiyBgJWjGCQZyQarVZytkVBDimsVOr+ygXejPkIUUDuPIFMwhG?=
 =?us-ascii?Q?UXNkIiy9jlnB0Ca6tQYykNmmg8sQOaW+h2JAn+seg6i0mOoHfVDwNnlowgI9?=
 =?us-ascii?Q?wlE8/VL2iV1v3SW50cBVxM7GtBVQygZCGgn4kY9Gh0nuTwwNtGIXAGufx2tU?=
 =?us-ascii?Q?PSJsqktWGdlyysnTYS4bgUlQUxabUwr2FVNRA3zFPFFVAKHP7ZKcWH4ATRmH?=
 =?us-ascii?Q?kkOIcYb8Cu1LaIkoCkgxzEHf+N4hOljDlComLg/IrT0o79MrxGDWnB/6R2IC?=
 =?us-ascii?Q?CsI9oG9R4MJDuA3UXU4ikO0JnLl3FEJd1E0J86b+CzPFqwqaD3hEGh3s0J1j?=
 =?us-ascii?Q?Za3FzQPpyzOFrcGVhm4sN+551ku185Vbq8VdCJsuekoeUZM9Xhp+ix025M6e?=
 =?us-ascii?Q?0SYyOsnECIX/X0qZ5bCthWORpx/8VIRZr1ZAIX7ENxw6WrMr9OksNyPr5+fg?=
 =?us-ascii?Q?8GjKKj9tIaN4Sa+U/U/mnoevnXXtkk19LMTaove6tRU2Fh/GjnhYuR4GaRDC?=
 =?us-ascii?Q?UdplRUlUn9hr9F6DT5FKg1CPtwI9A1I4d4xuSDtDXG8Ene3H497IXkLHNT1F?=
 =?us-ascii?Q?mIqlaWXUTeY7NljpwviN7HUSVGWv0jnYPI+stELGT/jilyTLbiQCVD0f5DHp?=
 =?us-ascii?Q?PtKQKWRU6gz/jjH86TAxPSL6EEb7rQwS9alFRVxPogy7kxW92ylq6PsjfUVA?=
 =?us-ascii?Q?2ODJSL3+Kn+JDuH/LyR4OiDQb59LXP+J3ZPNu9JN4oWvjUHCuEzXZNJ2Uohq?=
 =?us-ascii?Q?J0UaBD0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ccgerl7ngyJ/bRt1xtm5l1wO/V+MuuOjBNhFfc7kkptArAjtYZzdO6zfQEnV?=
 =?us-ascii?Q?sqDfmdhWu+PgfHZA65XRWMD9DgMha69iFH3K0CpqCkRG5yeWnSKqWIsaciP9?=
 =?us-ascii?Q?hPTAp/AwuHwTiIWEu6F+HSFLR4nbbthc+3DJFdEgpYH8qWOx7ZkJAtyJ5/xH?=
 =?us-ascii?Q?w7sz7KRA+VHRxHLsmHPDWMrpb1lEG86tLYyFWvZ2uI8H9bxuKttlUd7hhvXP?=
 =?us-ascii?Q?qgV1+iCB07q6D2ANDRY14e269wQvq1UK+cMeSMTGsRbJE0urf7KZm+gHzY7T?=
 =?us-ascii?Q?RzNyCtjecsf55Oc9fIjFNKY0eibPCfzaP/9q23q5+phVWA2RPjSN0BeeyBPP?=
 =?us-ascii?Q?NmUK/f1yTux2FF5BtR6WslUd0RUg5neul5uklvni2qkuCxSzWJGf5U4wnsui?=
 =?us-ascii?Q?BVbe3HYU+z0Ymv5sJRvRnDklklJmLK7SXo87fd03iyKg+ZrCVT1e+UlEJRmI?=
 =?us-ascii?Q?6324Zrj5N/jf7Bp7xzQVbjuN/R4kQhonvPEITH0e9n8XqRIx5JiEDonpl7yQ?=
 =?us-ascii?Q?Tq3EtZG2Uec64PLrP8ZPq93rG9swNX0j4/E8aoKQVT3d92MrJB8kjxsu1yMZ?=
 =?us-ascii?Q?6AbHgBIOCToFkBSTUdVbNYB4G/Pdevg41r4Z0o2u9Jjr3MzcHhlrAHQQSlEg?=
 =?us-ascii?Q?1D9mzOaPSHyl14ut0m8D6++dsevewXgv23N9V1Fzh5WnXqL6AdnFF+2UO3Sr?=
 =?us-ascii?Q?q/XtkJCyAyP2LPyRhwnv7i89iExrlUQWeuGgZjixdAuIYuC1F6H0M25b5rQ1?=
 =?us-ascii?Q?R3AwCVBpV5nDWZ5kXokKfPd24/xg0ndzbFp1Bc8nbp6YSBqZk2ZswKHxP6Gg?=
 =?us-ascii?Q?MCoJPVZlh0yaBRk9yMGmqv/kflDY9q/wG7EqqZE/heqoFndd9yuPQzL/iuFJ?=
 =?us-ascii?Q?WIGc1o48MZap9PfAda5tOaWNWmjvQV8JtDvQRBJj6xvTkwbOs029ef7SNs0R?=
 =?us-ascii?Q?cxoFXjsuiOxSIN93Mey5NNQQ4CFvewjz0jysN3EAk0jwT8/xxLCRQJIcbFTC?=
 =?us-ascii?Q?cwoB6oE0Fi/jl+f5fir8xkEe5au96xTWCzUBSc9g1Jis/BMKb3U5Grc7keoR?=
 =?us-ascii?Q?NB+GUSdB9VPEguTa9hBLIEEcIZy3odNtf5YlKZ/EihSEDLObVyzULBBfOT77?=
 =?us-ascii?Q?dYc+D49W8VwcrrFrBtplyuD0+o3rgZpyGT9+qefJ/pq5tmI4W0diaGYPTer+?=
 =?us-ascii?Q?6XccBebvYkg4nN9N3ilIVeMoIPMJUaTMdkU6+Zgq1bWkhxVmXWk2n09qrDL3?=
 =?us-ascii?Q?V/BAL/0La627EkLJxhqeln0IDDCRfK9efi5wa1Hp3Z7CBJnJtTi0Oyi4ev3c?=
 =?us-ascii?Q?tZtCWzwebceC3xn/CLCNSoENlGSWSP3o3FRAegKUX14T0g5xUeHxl2xO6E1H?=
 =?us-ascii?Q?IZyVjXD8RzIlkyGvyNKqjALJQ2Dsc/xb/6MxRRAON9u4XTKvyX7tWZqoykBt?=
 =?us-ascii?Q?aS9P4xzxdG/ILi5aYb9N3C84dI232yZYqjCw2oPiALnJu6srXGwER98i5dxZ?=
 =?us-ascii?Q?k+5905V+dW3N95N3jSI/AoW35mi7xRam1jc/0LFDM8StKoHAiZb6QsWxXn6n?=
 =?us-ascii?Q?VHz02xlLdBVZAS3/FqQytDhuxz+L99kOjWOasJ4b3m9p5+Qi/OGi3fECfSHr?=
 =?us-ascii?Q?Hq1qo2UIN8977A0gVivFeNg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ad3c82-380c-4eef-68f2-08dce803f970
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 01:44:54.8495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovmUM+Ln5d/wwv6D2JYgc8H/0pW2suWsHe6skFN7b57g7Hxo/lEh9CzIxypWkejZGZMj16HSuwqhIPe9p5+jLbEFIzbqIYKbBi+Wxxh+ilndGiMJaqxKe9MxGmBn18IT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11140
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

We already have of_graph_get_next_endpoint(), but it is not
intuitive to use in some case.

(X)	node {
(Y)		ports {
(P0)			port@0 { endpoint { remote-endpoint = ...; };};
(P10)			port@1 { endpoint { remote-endpoint = ...; };
(P11)				 endpoint { remote-endpoint = ...; };};
(P2)			port@2 { endpoint { remote-endpoint = ...; };};
		};
	};

For example, if I want to handle port@1's 2 endpoints (= P10, P11),
I want to use like below

	P10 = of_graph_get_next_endpoint(port1, NULL);
	P11 = of_graph_get_next_endpoint(port1, P10);

But 1st one will be error, because of_graph_get_next_endpoint()
requested 1st parameter is "node" (X) or "ports" (Y), not but "port".
Below works well, but it will get P0

	P0 = of_graph_get_next_endpoint(node,  NULL);
	P0 = of_graph_get_next_endpoint(ports, NULL);

In other words, we can't handle P10/P11 directly via
of_graph_get_next_endpoint().

There is another non intuitive behavior on of_graph_get_next_endpoint().
In case of if I could get P10 pointer for some way, and if I want to
handle port@1 things by loop, I would like use it like below

	/*
	 * "ep" is now P10, and handle port1 things here,
	 * but we don't know how many endpoints port1 have.
	 *
	 * Because "ep" is non NULL now, we can use port1
	 * as of_graph_get_next_endpoint(port1, xxx)
	 */
	do {
		/* do something for port1 specific things here */
	} while (ep = of_graph_get_next_endpoint(port1, ep))

But it also not worked as I expected.
I expect it will be P10 -> P11 -> NULL,
but      it will be P10 -> P11 -> P2,    because
of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".
It is not useful for generic driver.

To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()

	of_graph_get_next_port_endpoint(port1, NULL); // P10
	of_graph_get_next_port_endpoint(port1, P10);  // P11
	of_graph_get_next_port_endpoint(port1, P11);  // NULL

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c    | 27 +++++++++++++++++++++++++++
 include/linux/of_graph.h | 21 +++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6a5d27dd0c64..bf15bed69e6a 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -667,6 +667,33 @@ struct device_node *of_graph_get_next_port(const struct device_node *parent,
 }
 EXPORT_SYMBOL(of_graph_get_next_port);
 
+/**
+ * of_graph_get_next_port_endpoint() - get next endpoint node in port.
+ * If it reached to end of the port, it will return NULL.
+ * @port: pointer to the target port node
+ * @prev: previous endpoint node, or NULL to get first
+ *
+ * Return: An 'endpoint' node pointer with refcount incremented. Refcount
+ * of the passed @prev node is decremented.
+ */
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev)
+{
+	while (1) {
+		prev = of_get_next_child(port, prev);
+		if (!prev)
+			break;
+		if (WARN(!of_node_name_eq(prev, "endpoint"),
+			 "non endpoint node is used (%pOF)", prev))
+			continue;
+
+		break;
+	}
+
+	return prev;
+}
+EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
+
 /**
  * of_graph_get_next_endpoint() - get next endpoint node
  * @parent: pointer to the parent device node
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 44518f3583a4..a692d9d979a6 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -50,6 +50,18 @@ struct of_endpoint {
 	for (struct device_node *child __free(device_node) = of_graph_get_next_port(parent, NULL);\
 	     child != NULL; child = of_graph_get_next_port(parent, child))
 
+/**
+ * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
+ * @parent: parent port node
+ * @child: loop variable pointing to the current endpoint node
+ *
+ * When breaking out of the loop, and continue to use the @child, you need to
+ * use return_ptr(@child) or no_free_ptr(@child) not to call __free() for it.
+ */
+#define for_each_of_graph_port_endpoint(parent, child)			\
+	for (struct device_node *child __free(device_node) = of_graph_get_next_port_endpoint(parent, NULL);\
+	     child != NULL; child = of_graph_get_next_port_endpoint(parent, child))
+
 #ifdef CONFIG_OF
 bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
@@ -61,6 +73,8 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 					struct device_node *previous);
 struct device_node *of_graph_get_next_port(const struct device_node *parent,
 					   struct device_node *port);
+struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
+						    struct device_node *prev);
 struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg);
 struct device_node *of_graph_get_remote_endpoint(
@@ -114,6 +128,13 @@ static inline struct device_node *of_graph_get_next_port(
 	return NULL;
 }
 
+static inline struct device_node *of_graph_get_next_port_endpoint(
+					const struct device_node *parent,
+					struct device_node *previous)
+{
+	return NULL;
+}
+
 static inline struct device_node *of_graph_get_endpoint_by_regs(
 		const struct device_node *parent, int port_reg, int reg)
 {
-- 
2.43.0

