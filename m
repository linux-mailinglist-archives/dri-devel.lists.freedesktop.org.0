Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FECBDA4C
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B862610E468;
	Mon, 15 Dec 2025 11:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="V5iIaa8L";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V5iIaa8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF5E10E461
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:56:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MISVfN8Y0KnrVwDCV8MFxINNKq1gF4kvJ6Sx5t9ylExWZx510z0jpouhJWK6aew1VKQWF3TdQpPHzXYrZGaXOfs+He6nqjw4lowfvVbDjDOi4PMqe2IoZRYnf/NyaaC6zle3SLD2tvyescVjr2Nlu+G3IIHBN5HEvAUl0XYbaZf2JvSa1PK6QSVDXH1/V/loWJYyMisMfw5O9v72VORiJQ7AmDuJHPwrPESW4JIY5b9NUr3EPtCEtRxTFlwGUHSqld5xvhDE19dXw2H0jstt51kSgc6btYCElAAW85EfbgtMACK2ei1qPFjspsnkpqQL9cK6HctnNmZ3ypIJkDYx0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqdWduCkLYBAQptFu7kAPKORu52qhtzMtaBLDLQFywE=;
 b=UPwiG8XvgHT6utmaas23OjmSmGLs1dnht7Iu9CxPwYYA5M5LzexPObQH9dmavOP3s69292EKyi4JWwm1xSBNdvtZI/4j7pTx7eDgVfFgVMZ2WYsolGOIkuOkj0D0qOVecj9EK5sLaewDgX8cF/m3vdOj/6/kO5K0esQqaI7t8GQo7RCg8wCnVaFrMaKQjL96p6ZlFupnbCU3tH8p78+AasZlP/8xElXj1LMhqB8L85T5g/IP3U2hKKZWOlbT7WU2NKHToWhAWtxHi2lJpq/dpOxldzavz200feDlP6tuPRvXJ6W99ygJNbB3UVpQT76vuIXPdCmCxJt+tyeLz5mvbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqdWduCkLYBAQptFu7kAPKORu52qhtzMtaBLDLQFywE=;
 b=V5iIaa8LaPFO/itVWmnkSM9mtJCPOpSmDpNt4E6aZWu8LkaShWNzi+IEBJei5tLjrZ6AzuR81R5FJoz8TYNTKz53AXzMToRktMDW0sMrSdjjc3NnSZ06KJHCfIRsnOdkrZHbdIkXhLpwyFfEE0kXNn5+E5mNjNKANJEzMjhdrSI=
Received: from DU2PR04CA0216.eurprd04.prod.outlook.com (2603:10a6:10:2b1::11)
 by AM0PR08MB11831.eurprd08.prod.outlook.com (2603:10a6:20b:747::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:56:15 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::71) by DU2PR04CA0216.outlook.office365.com
 (2603:10a6:10:2b1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 11:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Mon, 15 Dec 2025 11:56:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2KejnTaoOtaLK6LRl9PfpHQ6EwX8nsR85oKHj5V0qgsGNgCtNR0K54qdGDNCmOTo3tAHd+EDqO9r5lXG+vyVA39r9woO+smPjOlByL4zc+Pryr0pyOISN9Z9HmduVKuDt9EKuL5+MY6GQilmrKHRJl5+ukkO3JZQ3YNPXMmvA+kuju9wqLcDb0e+tdCyAeGG1WbznCocg/N9hjBwh7EVDfJ2b+Z5CHN1XURL6zqHzUICltAzDYjzkVAzHGOXd7i6tVgXQ1XMR2513rfHmzcjbwTqx3Thdu7hzOB1Ccg3g19J3LKZ/UUtWgtJXqAAUG943TCvhG3WGrUuQwC0fqcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqdWduCkLYBAQptFu7kAPKORu52qhtzMtaBLDLQFywE=;
 b=M6upKs/RPA64GJ3ebOeAVygWa5lz03e5wYIHSfTEbx8ukA8l9oO/by94U9b7VUhU5VZqL97/hB9v7InAUUOPO6adJyDxudjkSPo/oSE89KHLBXXfEXkdPixHzSxj5eZwFr/bZfQG+mpyMnKcEnWX9/loE7RCuXBZQoFGqJ9OEqg7gW6ztfUj/w5sCJWV/jDyeBU+0So7BitwZ8W2hHZ/11gmSffPAB8Ibd9+URhAaFduRU7JdnyMFYaD/yPcgVLWxGv84ELY81r2OlKhG5ZSPYkgCe29vQBb8/mHUEMCYd+LhEroCg57FGmqPkivjrjF6Rx3l1S1e4pc5LNITVO5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqdWduCkLYBAQptFu7kAPKORu52qhtzMtaBLDLQFywE=;
 b=V5iIaa8LaPFO/itVWmnkSM9mtJCPOpSmDpNt4E6aZWu8LkaShWNzi+IEBJei5tLjrZ6AzuR81R5FJoz8TYNTKz53AXzMToRktMDW0sMrSdjjc3NnSZ06KJHCfIRsnOdkrZHbdIkXhLpwyFfEE0kXNn5+E5mNjNKANJEzMjhdrSI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by VI1PR08MB5312.eurprd08.prod.outlook.com (2603:10a6:803:139::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 11:55:07 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 11:55:06 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Toadere <paul.toadere@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v1 1/5] drm/panthor: Implement CS_FAULT propagation to
 userspace
Date: Mon, 15 Dec 2025 11:54:53 +0000
Message-Id: <20251215115457.2137485-2-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|VI1PR08MB5312:EE_|DB5PEPF00014B92:EE_|AM0PR08MB11831:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2231b9-8ed2-497e-0a30-08de3bd0f2f7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ltiSL0YdELkpu0GIQssiusNXN21PfdmZaytQIyR0BuzwNW87gXt84BFS2Tyk?=
 =?us-ascii?Q?KGuDFTkR08BBn7duMsOqVyJSBaHNJyzuCcTX9T83nKBz9H4YN2a9PiVaP+v6?=
 =?us-ascii?Q?mmHJSISCLvymXoaFZKfeWmT8d+hW4LO7mPG8K7//LD7RzliZ0F6q4yvLMMYi?=
 =?us-ascii?Q?eo57Sz7fFN7gmPppe43xpIjgXDDI7imAdF6mMpcpAmtXWM3+G6VQh4NqXUGf?=
 =?us-ascii?Q?eYoybQ/lCfFhA0ogz3hnjwy7AWwUtlA+7j3WYS2YdPk5A3O5/F3usmShGHo6?=
 =?us-ascii?Q?TX2GloILyEMnLcXUJnDmDCfZAJ14hrBA78Rkhnp6IbDhrjQqGfR69p72EpMb?=
 =?us-ascii?Q?G2+r/MJ4qMqhhsvwcOlch/uIXPRPmpYCutUCu/uoN6dNhm8iEZ3m6j2T4eAI?=
 =?us-ascii?Q?S6M1c8baXbhYsTdSojHcDFBzXaPFdbLLU10D0260NP7gvOE0V2QIqnmQy0oN?=
 =?us-ascii?Q?/zHtCF4EI4Ye2mGXCRpqybU/g2JgfcSMPS2dd0s5k4MS/nxL5rqiVuxR+YxM?=
 =?us-ascii?Q?IFJiU8/B8nZyJ0R0y7Fe72l7BHH8Iuzu6JFsxPvtPXJvCGeqgow1R0BVJ6Ty?=
 =?us-ascii?Q?Grfg3KS0saY31Bqo/oOutQinfsY+K/fwyA2doi6WtNpu13wcqA7knKr0tkxH?=
 =?us-ascii?Q?++BgZiJhadnRo2EABmtsRImTZFKvJjidf0/PCL51LKAgqDprvdOECO6PnkiN?=
 =?us-ascii?Q?m0s6B6hOUAGjiTWGrkGrVYUnzMjMLYlTb/PXq+xqEZxxZmRWfosFblZIYYHr?=
 =?us-ascii?Q?yexK7TIEV8PfPhuetl1KatCo0FfMZIKYjELLvAmvlFEVFA5LO/pM7vKfzVNM?=
 =?us-ascii?Q?whMy52KNToWVfAEozmJqUi/tlbh1KNKNFVLXJu0RB0o5+6kE2tIRy2WpuxDK?=
 =?us-ascii?Q?qM1tNTSBtHa2pCfteo8VeMTRMKderjmN7arX2eG7F0oM0J8pzL1Dtmo4jLAt?=
 =?us-ascii?Q?CPL2z6xyQQR8Z0wuYrd+5fGa+ICJmEPLfIr12r+Oqi+q3Wk3U1O51uWOSOKJ?=
 =?us-ascii?Q?3bkg8EkKmT0dop46sJMlFHEXLqGnzjm/oeiewv8qrdzaOehRuj3/ICjvfGXd?=
 =?us-ascii?Q?SZvYGvDs40tJY6nijQTW2YCJe09rjTymPePU5+ZhQ5AA0QRQ5D/LrH4Sowbf?=
 =?us-ascii?Q?RbwFPoY5YXLV7RthhR1sUrM1JtVN1by1Rh6uBYGHHt0c+9+bmzeRNrfGMoVJ?=
 =?us-ascii?Q?KgoqTbzLW/w0DIPF5sACMPg1ikxcyyQjgSmqHL/rS1R6KoD2nys5HnFnsqWD?=
 =?us-ascii?Q?JWb1HLfsIS40y6xyI4Pr8RmZznI8baFs9AJwrqg/xNG1SCg0oU6eNq23hBqO?=
 =?us-ascii?Q?SLBaKJ5WMUaPPHBymTaNEJbwtLrTQ7g8hjEs5z9BUDyXbVNTJQnPgSYmY3q+?=
 =?us-ascii?Q?BvuviPfUPKkEetN8rhWW/DAQbnZacfqz1N4DIelzjYJ0/hAZ+sDpeXZOerwr?=
 =?us-ascii?Q?3MrsBOtOmgo3pblfZaHM0AoTlMVs8Lzf?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9a38dcb3-5849-4485-ebc0-08de3bd0ca41
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P5ABMELX1rOMRtkCdeZZmWrnfMwQw81lBun+M1EMtqZoCGUF3WqAGoG1rLwz?=
 =?us-ascii?Q?4x+d+mLYClJJdQeSPK8y53rVxbJuvxPNS3pPr0QeG9Ajg544bFRZocmp2CgA?=
 =?us-ascii?Q?66tUmvn8CPvPxhI0zpcf30oF48XPcL5e5zA9SEahyMS+gM+shm+BHYaQgKQh?=
 =?us-ascii?Q?WPqkDCLJGYcoKNO6AIFZAiJnGv2tJIHS0u9lKFIuZ3mSJ0Ej2t3VM9R4d15d?=
 =?us-ascii?Q?VJ3fxoR03LjfC4CNJYTKbIlN5GfTRyQBFOpZqDBSxyD9sL8iSw5CfPCIi7or?=
 =?us-ascii?Q?bFZyaeWZP2osWIR+rrC39EcDhdemCjO3cWIKKHL1CF7BBxpTreear+/BLon3?=
 =?us-ascii?Q?duIGjDMXvoGbEdYKg33miYhttRRTU97vELJlFMMRmD4rQgjMHDQXSRp6f44k?=
 =?us-ascii?Q?+L6XAFc3cWjQcJX+OA1eJ3xmf50BGLR9XxxIrGrFqzOKHgluiM0K1S2g8dOd?=
 =?us-ascii?Q?2I1yq/+1arrceOPVDIm/f5wKo0kvBrKmIZzta7Gt2hcI0g6IcOOOQAuUtCEn?=
 =?us-ascii?Q?aRt26vmijiYY2FbcJETuB7exMBgn/iVNIv8fA97ReclEzFfuN5hNBTMkZC4W?=
 =?us-ascii?Q?zaWfCLuu3itDMqBMKDZDt0FNco2Gy4PqI1a7FqGyb21z/rxpvYrqjlA1ugzJ?=
 =?us-ascii?Q?HP8vyk6bZ7G+pgpriuoEAZXxFY07kGeg98kAwSizW4GAWlnyEcnhUXc/Snzb?=
 =?us-ascii?Q?rETPLUMqEVgfaZltGbstr54ukf89uf82l5wcy4NRM0rru3dAopOzzTpdBHYk?=
 =?us-ascii?Q?vP0RvnyJ7dNiEuNC1E8sF5RKK/15qavbrwzTHUPwlMPH/v/E8aW7iDfDlIoo?=
 =?us-ascii?Q?mmhZwrzrwKl37Y86avCOqDRUlKJePUZug/JtUn4pBCB6Wm3GSRnqZFHpO5Je?=
 =?us-ascii?Q?aa7Ha0o+k8h9CEYR94NDwitgvsNaPsghH/p5mDOpUKcgJIu8JWtOWBpFf3/C?=
 =?us-ascii?Q?0u336HIbCsljeFpN0m7gr0JgjT3jZ5PiZQW3E8By571zTVKtiVomro8FNhYT?=
 =?us-ascii?Q?611SkT4XQGyRQclDhaVXVwsxkbOClCsFxA4McKpNYanlFIVkfi/dOQgZPICN?=
 =?us-ascii?Q?xPeizvR9Y179YCk0/Ll2CdVUvpOOor6gLEQOMGp2plclaOcaClST5zRP/P5s?=
 =?us-ascii?Q?jmmxX8lJLFuOkjnOuvRpNpnQXJbgONDKTT8Zgi6iCs/pbNOwPARlOwORcz95?=
 =?us-ascii?Q?8PMK8mbupPDZQxPd62IFvhqEQzpBrUwSxk1ai92jX0+BJgJHFWXf0Etp5uyn?=
 =?us-ascii?Q?HvwX/jP5ziweFpvyZ/KBy7wsRTrQa67AJlOq0TbJEFlgFNZ0222yyHEa46tm?=
 =?us-ascii?Q?bhrRrQ7CNJVZlGhu2eaHqS64lWMx1C/+EPV6qcEnvrH9ETuVwAcP5DDgy1Vy?=
 =?us-ascii?Q?kbh0he0Hp5AOY34903m5wEMedw4t/HP590SR348GZySqTH0ujSBPmnnTx+ye?=
 =?us-ascii?Q?XogUnZYBCxflQ69wMOulMuoqj7BhcbNKRazXjuJZVFiJyUVoV1whXVRZrhKB?=
 =?us-ascii?Q?NDcswChG8vwgsXn4sjkpFT1FM8wyXk2UNpraKClckcaQGqAapW4DYM5rb8wo?=
 =?us-ascii?Q?bCwRC2uVLQemq25jrYU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(14060799003)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 11:56:14.7690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2231b9-8ed2-497e-0a30-08de3bd0f2f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB11831
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

From: Paul Toadere <paul.toadere@arm.com>

Though faulted queues do not prevent further submission, the
recoverable faults may have further consequences which are
worth recording and providing to the user.

Signed-off-by: Paul Toadere <paul.toadere@arm.com>
Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 18 +++++++++++++++---
 include/uapi/drm/panthor_drm.h          | 11 +++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a17b067a0439..eb8841beba39 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -569,6 +569,14 @@ struct panthor_group {
 	/** @fatal_queues: Bitmask reflecting the queues that hit a fatal exception. */
 	u32 fatal_queues;
 
+	/**
+	 * @fault_queues: Bitmask reflecting the queues that hit a recoverable exception.
+	 *
+	 * This field is reset when the GROUP_GET_STATE ioctl is used to collect the fault
+	 * information.
+	 */
+	u32 fault_queues;
+
 	/** @tiler_oom: Mask of queues that have a tiler OOM event to process. */
 	atomic_t tiler_oom;
 
@@ -1553,6 +1561,8 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
 	if (group) {
 		drm_warn(&ptdev->base, "CS_FAULT: pid=%d, comm=%s\n",
 			 group->task_info.pid, group->task_info.comm);
+
+		group->fault_queues |= BIT(cs_id);
 	}
 
 	drm_warn(&ptdev->base,
@@ -3807,9 +3817,6 @@ int panthor_group_get_state(struct panthor_file *pfile,
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_group *group;
 
-	if (get_state->pad)
-		return -EINVAL;
-
 	group = group_from_handle(gpool, get_state->group_handle);
 	if (!group)
 		return -EINVAL;
@@ -3825,6 +3832,11 @@ int panthor_group_get_state(struct panthor_file *pfile,
 	}
 	if (group->innocent)
 		get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
+	if (group->fault_queues) {
+		get_state->state |= DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT;
+		get_state->fault_queues = group->fault_queues;
+		group->fault_queues = 0;
+	}
 	mutex_unlock(&sched->lock);
 
 	group_put(group);
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e238c6264fa1..77262d2b9672 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -965,6 +965,13 @@ enum drm_panthor_group_state_flags {
 	 * DRM_PANTHOR_GROUP_STATE_FATAL_FAULT is not.
 	 */
 	DRM_PANTHOR_GROUP_STATE_INNOCENT = 1 << 2,
+
+	/**
+	 * @DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT: Group had recoverable faults.
+	 *
+	 * When a group ends up with this flag set, jobs can still be submitted to its queues.
+	 */
+	DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT = 1 << 3,
 };
 
 /**
@@ -986,8 +993,8 @@ struct drm_panthor_group_get_state {
 	/** @fatal_queues: Bitmask of queues that faced fatal faults. */
 	__u32 fatal_queues;
 
-	/** @pad: MBZ */
-	__u32 pad;
+	/** @fatal_queues: Bitmask of queues that faced fatal faults. */
+	__u32 fault_queues;
 };
 
 /**
-- 
2.33.0.dirty

