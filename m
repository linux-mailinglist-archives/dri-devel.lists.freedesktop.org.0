Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE521B483FD
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CDF10E0E5;
	Mon,  8 Sep 2025 06:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="QRg5+9SN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023075.outbound.protection.outlook.com
 [52.101.83.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2310E0E5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dn6CP4der2z8ht/bBY9GAR10WE+6DIFE1tp4GiH/nvJzwXXfFJQcWbGmhFnH5b/SFRqYS4ydygY2h/VyB9VxFPCIHFNIluFsI4ZvcjERMC67WhNl/FuVPVSpsL49018ckPdH054OEqq7n33FIwJxui14+m1EYJNVzh1wa0HO2/u64XDpDpII3fZSCrDYB1e3m+l/Hq0t1ZkhjKUHk/7mkk3/pq166Xre7XgaklBWwMIWcmY9IfTmBjQlZ5dY9dzo/me7s+MpK+ICLdg87yD4GMn3wDJvaP5zg1uYVHvxc8iooLkdtZUCUIYApAzroznOWccPC5i6vWOoUJBBlDRI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oslatcq+q/WiVKE/fHOA0DGSBMiLxr7O/QvertWDXSI=;
 b=hLxKBWrYmzIW3UXULek2JQ+lg9BX7gZXSGShyzfZC4+3pDOSJ3RNTzKHWvxjzybCvlSAZxWRclqF4B+fLrM7x++QQhsOx9hdBN1Cv79BC2QZYPV/mv3I/Z5XlqKVPFAXkODay56dJAJs92IX7Vk3hXQkjpCdkO96DaTg9JuQUxgh7voz0CliUPqMLciYaIcXtko0c3jinugq5f+XTCoS1v86tQe9q4GnPE6N7zdzPcALesqGAVcrxxRArtABo3etBNeoqYSC2HfNdS0EnjktjzUy3EXg79ORxdrEs9rRtf0HeWXse2wdahoozlSD3lG+Xmub5/BEyKZBYZD4FSGWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oslatcq+q/WiVKE/fHOA0DGSBMiLxr7O/QvertWDXSI=;
 b=QRg5+9SN05iD8oXy+spIVKFNCGYxrJqSPoJrMZlgLbXMRS8DeSVZFed1HgbrSM7PQP9vJ+24UsYnqEJkYuxst4dGJi+9elbaaz0I649qRq73/YTiCUl535J10FO7PbTTyDKeqjHtddki47V7awfhrQjewLF3yU4enyEFFea+fMJB1icYrsKWQ1nyw6ZAY3W5ZnP0ojiDJWml8vRGpTYdSgZiGKNAzOHVsqrCGGLaxSRKImtr1wBB2lRA+JFurxS/ZUsZ3QCf9s6ihp84Azqc/E4vQPVWoQ48JyIZKekancYlzZ7f1jKSxxnu0a3isLHn1XuLj4b7zQ2WrpmbREOjAw==
Received: from AM0PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::39)
 by GVXPR04MB11020.eurprd04.prod.outlook.com (2603:10a6:150:227::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 8 Sep
 2025 06:16:17 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::61) by AM0PR10CA0086.outlook.office365.com
 (2603:10a6:208:15::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 06:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 06:16:16 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com (40.93.76.78) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 08 Sep 2025 06:16:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU7PR04MB11091.eurprd04.prod.outlook.com (2603:10a6:10:5b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 06:16:11 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9115.007; Mon, 8 Sep 2025
 06:16:11 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 8 Sep 2025 08:15:56 +0200
Message-ID: <20250908061605.76787-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::26) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU7PR04MB11091:EE_|AMS0EPF00000190:EE_|GVXPR04MB11020:EE_
X-MS-Office365-Filtering-Correlation-Id: e83eb180-7f4e-422c-a52c-08ddee9f3851
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?VPo+XueLhyRyPLK3ZkM+jQyCACgeIERLsJPw4jYbyqXrDnpFfQssKIC2ptSF?=
 =?us-ascii?Q?4G9/OXJG+X9wKCJe3euKqYDfpsNhh3kf/NVI+BweFxSHqKgIIwGt91lhb86O?=
 =?us-ascii?Q?1Ez/z0ebDFBAITeaiP3Zf8HafAL1scACbrowfI7TYhhLbfztUNw4XztavMLC?=
 =?us-ascii?Q?6kipJxNVPqO1QyiAtNq34TArZBzBQjS8WUy0KyoI2Egjrj88mzpBmywG706p?=
 =?us-ascii?Q?CFong5gHOwU0aCaIsE1fyfORy/GNxrohg6SXC4SGetb92Fvbq2mxA82DkNUe?=
 =?us-ascii?Q?ztWdc322jpuFZ70sNci7hTMUeFT6pwcx0iAbuS4QaOyeykW+MPpuVAElx47J?=
 =?us-ascii?Q?uEBhZR0sS+g+RMAXrqCNaZYA+nhR/at+uyQkeHwue5ck00IfvNvPMurOJEak?=
 =?us-ascii?Q?cw9yYOkEort/AiXAM/ashq3//ZyBTVuMCUKUw9ROWP/yOpk3U3DnuLJqNuf9?=
 =?us-ascii?Q?pJUmXsh1j9imbHfru4HMRsUTKAP2uyaJx7USUGqx4QJSylFUBG0ZJg/Pleu8?=
 =?us-ascii?Q?PU9314iNVmV1kLEswtjhR6eGOUUCH0m1C5WlHMaACi50q/NLNhPIIyqatWE9?=
 =?us-ascii?Q?6D1DdhmgN5WWt2YAGXeZuqKMMbF92i51vlodbuKXLB7pB2xm8IC8vPScjzR8?=
 =?us-ascii?Q?b/5SpiGG/7VEopos6r9smm4apIR/+Abj66WAdwo1IVfuutjU2AsF42BMDObL?=
 =?us-ascii?Q?tgQaATSkdKKLZeBlRdN3QjtpSYiDTQBcIpwIf9JzHhD/qka0alQXw0kHVakg?=
 =?us-ascii?Q?qZO47r5dBYixLMT7zbGojMIuYK0mHIj7e1L+CJkdkOIpBoS/30cC1cq7USbZ?=
 =?us-ascii?Q?KL5auIlT4CH3KEtL7q0tZj4yIMPjl2hQDte6i7ggYY09VDZeA3CgmRcBVJ5k?=
 =?us-ascii?Q?g1eAZpFIe4fcNAjN+xLFqCo58mbTPo0lNKlEl6uvAMJQLIs4MLvn7CBMhyQl?=
 =?us-ascii?Q?cLreV1ljJ5gL1XwC28xLKURhOsQg6Zl5gQLAv3cl84TguJqI4yj6TLkBJkMe?=
 =?us-ascii?Q?Cjpoz0EnMl4A96YddCim32SaOKFWIqKs7iyw82oZfVu9/1Wm5Cf1bSjUUu7W?=
 =?us-ascii?Q?4imGZW8hEKih7LFulDXNEgfnEAuwyfnHKM8AjN+GuazXtH3g2qoFV/mHZT2k?=
 =?us-ascii?Q?ny6vFnH1SIRey9IqIOYPwO8kOXukfjDoez8wd8D9N2MFt8n0e6E6uh61gxwY?=
 =?us-ascii?Q?g+bFl00JaJZKwsu/kr0VhbjCHp2+4PXcDHBsNIpYv7deQeNgJmxGJB4v7Etq?=
 =?us-ascii?Q?E5/mMKQO/ibQL1KVri4Vfmj1gvkv70U7GR2ELQ2GIwiF6BBVUuDOLtduvGR6?=
 =?us-ascii?Q?IFjspGRpLFjpmLPEBYElye+ROx7NNE60yHnJHA0oBvSZuzZxkLr6VZrigWUA?=
 =?us-ascii?Q?ck36EymzHMNxUR8N5rCOND+twRg8/pfNeGhihbptsNKhwLSOyktXuLqMuzgg?=
 =?us-ascii?Q?m5TWXNDRxMl9eagA2gJUMy4eeGdfayltEX21VrGu9dPFMkRyawI0vA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11091
X-CodeTwo-MessageID: 7e21a29d-8644-4db2-bea4-56d1d803ea6d.20250908061616@westeu11-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.57586665-3488-4462-a637-86a93c4d061d@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b5d055f-88c5-44ab-50fa-08ddee9f34bf
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|14060799003|82310400026|376014|1800799024|35042699022|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZBLHXDnY0VNmw05V4lO0UxnphdTGDq0uBbyRnlbiT3fX6UPIJwb2uRNSjKb+?=
 =?us-ascii?Q?ogknljusaBpav12ogmQNVxWuk0tOigmK0IEfPVf7Vs+JETT12GkQHmnw1i08?=
 =?us-ascii?Q?YaWyhhos+zaaA999gVFbRU81OX28SyJwfiyHvLhurMFlKI/8EdH+ZRIQ78Tb?=
 =?us-ascii?Q?7ZgLBpdZF+N+vhq3O1BZrtG9gXU/ooHq/xlX7JPpbskl34rNGpK8J+bxHmVy?=
 =?us-ascii?Q?Q0tub439zupgZwTcfBwBs10OP9uoUhTnsyS9HhHxlr8boKPqFf0Mc+d6Lcv5?=
 =?us-ascii?Q?fLJoCz9JW2i9544Htyc7I8gQJJoCeHj/Ha9ihB57hWe4ExXkM6pB2zyHtF/l?=
 =?us-ascii?Q?2u6Sp+A/T1II0FwNUf10I5hGMvX5xfwRewQbNbkoWFtve++/mR9la3g0hje4?=
 =?us-ascii?Q?1oWDQhALZKs4Z/k+BNjDwQ7Xav/GNPw/EloT8N9dnXDpY2DJIWx1VO1EAkI3?=
 =?us-ascii?Q?0sEs3cf1OTtmU0I4mv7alOOxnhGeLdL7UXsE91fTtrtESw3+njkJmMLA5DS5?=
 =?us-ascii?Q?hw67IlzxSVwEksvm5ctwStRR///SDsipNEjvFKPIUwwEmPeGo0e01K1GLeV/?=
 =?us-ascii?Q?vZKidgl/TKuueUnjs+kq8UYkPsKOhqzwh9Zb2o4SAN0XPfvi4qPfXiKtM8NJ?=
 =?us-ascii?Q?Pt33jshXwqO4ZBUA/ZZwDhqUbyEX5cIHADwN4TNcY42oARyUS0DLrY2UDZ18?=
 =?us-ascii?Q?cUkW0IXww9wxVV7zWo16LLFFd9G+YhnV0Xd64wlE/nCfLjFkETFKixUC0zbY?=
 =?us-ascii?Q?YwkY4vkXLpHn5o9U+iIPt4zUeOsqhzbLxaTDAK3BDkggR2rRuReMS3i0elbv?=
 =?us-ascii?Q?zYukNj3NYYKUimou9dBl8lUjHvI3ffB7Py0pt3h/eoHg7uXqa+3zyPpSVJ/L?=
 =?us-ascii?Q?V7xeeJA8FqFbBQJixN399xzSzIc7L7FBZplH6Vswb3dCmll6spXnm8ATJZVD?=
 =?us-ascii?Q?JpItDF8OXpF9JgWjLGa19hy0A12OXd5c8Bj+9IDW1Xwc8cz2LDFz9ylF0Eun?=
 =?us-ascii?Q?si69/WcsUKVI3Gnhw+RytJzzlZoD+ZCiaiDxN43ecpICyYc9LDRV8NBZ9JAb?=
 =?us-ascii?Q?IG7WK5Ad6twanmaL3GAGW0NhaDK8QkOpAxOwugDyKdnMPy/SIRfJ2uYcDcbz?=
 =?us-ascii?Q?tooRIBNSZ7xj6Q0BoUxrBFcc4uniDN0g6gKNS+AR2DJSL0LQK/fSP6gkXRNv?=
 =?us-ascii?Q?4xhFxZ/tQgqaZBzQ4n0KneuclIwASHGmiDbuzBZ+MExlabQpf4QElIK1MT3N?=
 =?us-ascii?Q?pY7Ii5h8n7WRRNszrD0gHMT3b7uzWAFfxuAVK59fbBHxcEq244veJ3QYOgqx?=
 =?us-ascii?Q?oDvZ/hixVsVGyzZYW6tV9UPTkhjjwYtHdRf/OBpfEHkA+W9zlB9K78rZ5SEp?=
 =?us-ascii?Q?n00dWuvGyrO0fsUgDAzDUj4haFnlLQ1uFlmdTGqYoaCzqkrOw60SlSM/yvN0?=
 =?us-ascii?Q?Ex+rUamtsNxv5MjkyfAF3oYc9OJUai8KDkcut7a2br6TNJ+By0UzIQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(7416014)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(36860700013)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 06:16:16.8008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e83eb180-7f4e-422c-a52c-08ddee9f3851
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11020
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


In the past I've seen (and contributed to) hacks that model the chips as
phy or even (really!) clock drivers. Since the chip usually sits between
a signal that is (almost) HDMI and a HDMI connector, I decided to stop
lying and write it as a DRM bridge driver.

Our experience with these chips is that they work best under manual control
enabling them only once the signal is active. At low resolutions (under 4k)=
,
the optimal setting is usually to only use redriver mode. Setting the
termination to 150-300 Ohms improves EMC performance at lower resolutions,
hence the driver enables 75-150 Ohms for HDMI2 modes and defaults to
150-300 Ohm termination for other modes.


Changes in v5:
ti,equalizer and ti,mode changed to enum
Rename ti,slew-rate to slew-rate
Make properties conditional for DP159/TMDS181
Remove ti,dvi-mode (always set to avoid conflict)
Really added vcc/vdd regulator support
"oe" gpio is now "reset" (reversed logic)
devicetree enums ti,equalizer and ti,mode
Always disable HDMI_SEL (formerly "dvi-mode")

Changes in v4:
Use fallback compatible
dev_err_probe, this_module, of_match_ptr
Use fallback compatible
Add vcc-supply and vdd-supply

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

Changes in v2:
Document driver specific bindings like slew-rate and threshold
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

Mike Looijmans (2):
  dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and SN65DP159
    bindings
  drm: bridge: Add TI tmds181 and sn65dp159 driver

 .../bindings/display/bridge/ti,tmds181.yaml   | 170 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 427 ++++++++++++++++++
 4 files changed, 609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

--=20
2.43.0

base-commit: 53e760d8949895390e256e723e7ee46618310361
branch: drm-ti-tmds181

Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
