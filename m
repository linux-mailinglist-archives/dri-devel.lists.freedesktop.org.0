Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A65C0F321
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2F510E4E3;
	Mon, 27 Oct 2025 16:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="k6JpCrob";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="k6JpCrob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E51910E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N6lYQVXa5jcUen1zAbbfCDc1XKixGWCTbRc/kYnNX+lUBp2iOFCrVOSe9WRcxxf2t2qfn+vlumLAJIFonProBM7Yi3A3CThA9P5z7enigE4oKSi+PRA7KU4g6hygd/Z2Oe5cMLlAjkScirlTaO7gEgOs0JytE6blNTDYg2DTZ2y1kOMvNfEV7tY53AfWmv5dKXCdfrHeL05+PLCKUzmkCJ+hQl0vE1pb7J+NwkGBoMaKOBucMTUYVWohKaND/Wc9y+Jbzc8wtmosSlhY7Lz26xopyDTS6wli/nhktja9ut0QA+RGv5vKe3G/yc+GL3WbSoDf70DHMjUAAR5EO1GCSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozDzbfHWgGM8qt8AgjuEX/zyXFbmgyzZqizAiek7F1Y=;
 b=Cx7ltorEHBWrk7RLpW4qct+zDxGhXURph8ggiSXYH0IeAjrPKt9xTQpkciwuXzWBTxvopyZtUlFdcdWRxBh69rlN7JRpJuvwiYaQ3zFy25yoWC9AhjGno+zeN5x9F+A6e6Q4FzmRfHiC9p8YohZEXWmTroC4dJhXpxl6QYWwAq3PsyucUrekQk/Y4Q0+PJ1l7CWFYGOXanJPUO1EbC3vb60Tv4zz9MSu8P0JUIFmOkOCm33RrZuivcKxsyM1hpcElMkVFNuGoz6Js3vXj4I/EC2Lwd9gnGqtsuBRLuT2saph8BRJNqgmL+xvxrPAPtJiT/bfTaF7JaeH3eiqtuTKdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozDzbfHWgGM8qt8AgjuEX/zyXFbmgyzZqizAiek7F1Y=;
 b=k6JpCrobrdUJPQrGv5wgBwqqlci/SP5rSfm/7u2jD2iME0cuPBf+rPlihMeYg300HLGRZ4jC1NrbNbNHUN4gduNUQIfZw8+Fh3hVwlGSkFtMQn/WkOplG8ysWPy+hToyyAO4IDBekMEO8WZ+w/v4A/jSdn+e4aHqOV7e9q1QQrY=
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by AS8PR08MB6165.eurprd08.prod.outlook.com
 (2603:10a6:20b:29a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 16:14:15 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::9a) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 16:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 16:14:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFoki/jsmmL5iZnxriQFMIUofgsipgHQoysWysSPqjBSOTLbnJkWhoqNDMFsBpcOnz1D+gYCGYQi4LuYdvzEGmreDMjEefBkaAnLDhHpPWWvu+M1zXxfnXEmTDZLPRD+GuvpI0SJT+incA9H6LqOOMacgXQPlAxAN2oWrcmV0a9koSwRTdZiw422Ny4dtNF9cGo0XlEsEGq+fmJa+mobtJmh0hfPkA6JzieFS1y6tKmWjQgj/GnP/7AZIMwhYNay0Qyv2rtfoLdGJYSODV4Hld5brLLlTQRNT5rRjWxGy/6G5U1/F5sWYyDcwoxvh1VOUdm72JG2Wz1eYs/AMMw6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozDzbfHWgGM8qt8AgjuEX/zyXFbmgyzZqizAiek7F1Y=;
 b=EzGcqeqCcmLGvDyhg4E1ONnPGEahKJ8JZiHFAbsuRFOyL9CmtDB/9n/FVfn08CrdI7+jIyAVHhzZOYWVjuAomSLeOY7K0f9X2avbGll8p94NV2YVn3Daj4K2qHkLNGa3VFtvbcNNE4mgYZBwlnx4QR9Kx+wpbG90gKnsxLiTgS+6tYZFUtoaPdFWT/hTik3bGOEgiJEuY19/Y8pXfld5EwrmJWU9d5+j8yauJijikzvmHvUIgQK9myjHXDH9BBouVIaHAlcpXfNl0Nz2XTCV+GQmgRlrWWeHzN7jMDqJylWboW3x6z736OCicNdS6pSH6jdZVXtCtxE94hbX63iUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozDzbfHWgGM8qt8AgjuEX/zyXFbmgyzZqizAiek7F1Y=;
 b=k6JpCrobrdUJPQrGv5wgBwqqlci/SP5rSfm/7u2jD2iME0cuPBf+rPlihMeYg300HLGRZ4jC1NrbNbNHUN4gduNUQIfZw8+Fh3hVwlGSkFtMQn/WkOplG8ysWPy+hToyyAO4IDBekMEO8WZ+w/v4A/jSdn+e4aHqOV7e9q1QQrY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB4PR08MB9335.eurprd08.prod.outlook.com
 (2603:10a6:10:3f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:42 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:42 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Date: Mon, 27 Oct 2025 16:13:29 +0000
Message-ID: <20251027161334.854650-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::26) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB4PR08MB9335:EE_|DU6PEPF0000B61C:EE_|AS8PR08MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 55729f41-32a8-448c-8eae-08de1573dfc4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?DRkI6jO5q/9yVlPfRoGmII+DBHA6DEOsSurKHekm20qRzacaXBCdcdkpUZ2+?=
 =?us-ascii?Q?ZunKM8+EqqFx26oS9o+95C2y3ufC7OUGCCrSoXCA+u0gowyVERMJxp6EX3Bb?=
 =?us-ascii?Q?QuyXEFjKPGC/Tkj9TYdHJl+4h9be/FB5e6Z7sii4XzshDZ+J0sxBbWvDoJ3h?=
 =?us-ascii?Q?N4p4Iq+XweAMuoU1qT2QK+cMu81a9r3FTPCRlTDxZUf+d0WpbHPaOmyXKElT?=
 =?us-ascii?Q?14b7/Uu/GZzDo0mcKEUyhaE1d3NIRI02wjE5ii0IlZJSDheFdskHqN5yAtjG?=
 =?us-ascii?Q?wdJFp1YTt3yj6tQGbmBV0Co33dTzJFsIDevUCRoFCN09aPKLtYK7MRIaTA72?=
 =?us-ascii?Q?v3KC5WmVGjucsgTXxCILKC1Gz/WA1RV8bM+0TYtyD7y16TspcxngA4EUq/Qr?=
 =?us-ascii?Q?SuKFwN/IXae8t62vpPnFO4Lf5w8I4CVHnhpvHqkKvXB4PBtrhldFZj6asgxD?=
 =?us-ascii?Q?iTcP+W4CGisbjYxwsZct0sGfZWe4fTDBM1bqny3l1a2slbwdqex/tcLhXysI?=
 =?us-ascii?Q?NgsyiiQBm44kBX7qog4YLmdngQXVvnh2/6I+dS1O3S/NmE+RSezJ5t7tT/1W?=
 =?us-ascii?Q?UTBFBpPt8h30+1Z1tKCuN4l4rE3dUTTmjy6/cJIJJwV0xqM2mph4bwyoavAe?=
 =?us-ascii?Q?o+3Y/XMU5S2DeIqfAUyCtp8d8ehVOOH8jwn4RJ6JVMJdL3Hv3uD/nrhmZZOC?=
 =?us-ascii?Q?kEl4Q1vhiXrEgt7qJKqcwTytKBAUH3lEwWoK9ELTjpbneK3dm+CtFgzKzu0V?=
 =?us-ascii?Q?c2SetId9iJHBRTLMRfUhQ+Ga2FYyNWR7meExFSx6c3NlGEWWPh3Po5pNDVzD?=
 =?us-ascii?Q?RKqk0UQ9uG3joIc/9xz/zVXTd6GxW8O+nWiytVTM8/vyTMsOEr005BVMKeak?=
 =?us-ascii?Q?L4HkapYFmoglnc1Mc8pLiRKhPbV9Cc9tGL8cgA8qT6jdYzW8NUC3AWVyXBRz?=
 =?us-ascii?Q?fgUZ+83np8GzM0IjLa1ZvS2dWF2quQ2/ell0TOYkGvhJoCUX+reIip+Uv+k3?=
 =?us-ascii?Q?n63c2U93YuGZnx3pJCGdotTcrKrT9JTuAI+M4Wfm9jDn2R3NIQ76DPbSVrKd?=
 =?us-ascii?Q?J+/Qb7kHF6B1EbtcPQNk/4aDrKMqJo33u2/aYJFZbTUMDIjutd4bX+zX4z0Z?=
 =?us-ascii?Q?2MqhF2ZzI+cFwEJFXCaGfF0VOfxBvRVCzbdmhq8fJWaWskVx8mCi/cBfV5TP?=
 =?us-ascii?Q?3BxFlyO7P69VsEd6xrWixD32ySP9f0cfykPej8rq7Ph94ZlzqomRz9iqJqRJ?=
 =?us-ascii?Q?H6WC5FdwKxGqiBSeuZ8OaeNmLiVo4inXzjbbkN4A1b4/RfNQb4qT+I2fNAWd?=
 =?us-ascii?Q?2W/MMj9mZz0fyy/7Q9p84hNLNXVxp/TjduVVHzd4RnyAhjSgR/Yn24gyh1kA?=
 =?us-ascii?Q?JEI4ydgSvpmk48MTTd6VbG5BXW89kj/ZK5dwjoZV4S7Sh1OvlsPSeS7icqYm?=
 =?us-ascii?Q?ose93spOk36hAZ04FROArLbzrkz6QJUZ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 06d68a33-10e6-4d93-c09b-08de1573cc1c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|14060799003|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oRWQ3jmutYcUZMwAgtWJQOQtoRO7b2UQlVGurrYOdWq5REZUnCeEBUn24MH0?=
 =?us-ascii?Q?VNZkxC24gHjFHjY+KMSQdQtbpkWaRaDEkyBhva0MemeRoahlbyakAX91CEF3?=
 =?us-ascii?Q?UML1wOsh6B+Oxj60wzuP2kiyTfa7V7D7G0HI0t7VcuKrJl2w7YAPhED3Qewl?=
 =?us-ascii?Q?oFUE2KcDtSVJmT1XEhLx1Zd0OdAau8qFhuMpePtw3AtHq3jviVpzbL1+9GEu?=
 =?us-ascii?Q?gpBSxjkvPpLC4wX1ruT8s9DV70LqFu+NtPeSmoWaboYw8JzR4DFslKA+2Zt5?=
 =?us-ascii?Q?BEcbF/EtoFO2wBjrASLuXUtK86PsBDP3TmRNtkF3FUJdkF7Jerw6m1MUA6aL?=
 =?us-ascii?Q?hC86zBYIL+ureGui1PL2Rwj+fvN7cRvNcQXWPIU5CFgwpXP8n4qzMMykJqoa?=
 =?us-ascii?Q?BpOIcTJrE/w4nZiGIdCBBwndQHDbjJkk9j2LzcjxPlYmMo/b0W6JKXvKWJjP?=
 =?us-ascii?Q?KaY6n0VJeH3RWAma3lIxoIBUjt7Z9D1DShbUKTuqrFq1d+SLpdi+I3SW0q7d?=
 =?us-ascii?Q?tmUZvtzQaL3XE65l4j8ovQ6txzealhB9fQMHnB3k0TeVcR4xm0qWYfWEny2G?=
 =?us-ascii?Q?5IF2IjSs8JfYXjcUYGTOysSezYdLbx6StNLiao53M+PiIyGshIp42P/iN5Zz?=
 =?us-ascii?Q?48iPLWLo8yQAhH0yjPzvVI37oZtArFLjYSDE+o6TgCGNMfmybQmBBKhLWxvR?=
 =?us-ascii?Q?RLVJlnHcwN+HiuJLySEq96TdQR4WqBuu/tuqH8WpzcAsPOvDaDvhIEE0NI0/?=
 =?us-ascii?Q?sb1pwNnzQHtTM2ST2K1pGHYKIso4iw51SRHs9gcNTDO1TJhTPCX7lAnWf4/7?=
 =?us-ascii?Q?+5cN/NTF8zzx3eAADYduCkBsRjwCX2CDSBWtXmyyMwLFLwuKHO/mvGGj80IJ?=
 =?us-ascii?Q?7rd2z0DarlGQUyPKrxns3CukKVq677sb7KCRMNKWdGLi2OLgdYEDxL7HJTzz?=
 =?us-ascii?Q?Dod1+CRFtJFN3D4wxCwjmYVA17qroD9yV/MYAh5XghNADRJLth4fTLSMgWXD?=
 =?us-ascii?Q?+i/onZZOa4beeAoPxl/89aH6Nwin54GlK81HB6Vxmq3ATgeD4O2m8UQSFuvX?=
 =?us-ascii?Q?oubCKbNYal5vFu9ncDW+CIeIwgtbORvkLjsy+sJM2j6WPrQDCw4rTwpLWxoe?=
 =?us-ascii?Q?Y0KRuS4E8qHfw7+gqLYiOGyWUGqx26hbgAc9EsH8i8hOmWtFun/zfleV7345?=
 =?us-ascii?Q?4I8JoFU2RrpkH1U3FAR07r70kkpQ+mmdsYBdCXiTxZZObPLVPZNDx1chUTwv?=
 =?us-ascii?Q?UEM2bZBvlGdWb2U5u7TS9PVyjYcm9Vfr9O/ynr2QjtDxjzK2PZIy+dzC/KMp?=
 =?us-ascii?Q?fliclewQ89VR/Ng0hb+zcX2cfl3yBvVMDREcn4ZI2W9k2uh/fs5yo8yzMzF4?=
 =?us-ascii?Q?sLTEx/sDmAO3MQnNelNWrqKQhE0juvJHsZ8/167jDV0s64w+woyw59Lcf48E?=
 =?us-ascii?Q?j0r4acFdPMaLW1CqfDtFtVGRxzIEJW3dUsccUrsDAPcMaNcgajvnqvp5P586?=
 =?us-ascii?Q?9jlkxt11AB5et8ZjfpwtjQxYyzLJ7fsItVNjF3t+lii/Aa64tFFcrjzVi8y3?=
 =?us-ascii?Q?TfuZONT38xdUpstdz2M=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(82310400026)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:15.1648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55729f41-32a8-448c-8eae-08de1573dfc4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6165
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

Add the new panthor_pwr module, which provides basic power control
management for Mali-G1 GPUs. The initial implementation includes
infrastructure for initializing the PWR_CONTROL block, requesting and
handling its IRQ, and checking for PWR_CONTROL support based on GPU
architecture.

The patch also integrates panthor_pwr with the device lifecycle (init,
suspend, resume, and unplug) through the new API functions. It also
registers the IRQ handler under the 'gpu' IRQ as the PWR_CONTROL block
is located within the GPU_CONTROL block.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v3:
 * Turned panthor_hw_has_pwr_ctrl() into a static inline function.
v2:
 * Removed stub functions.
 * Updated BIT() definitions for 64-bit fields to use BIT_U64() to
   address kernel test robot warnings for 32-bit systems.
 * Moved GPU_FEATURES_RAY_TRAVERSAL definition to the next patch where
   it is being used.
 * Drop the use of feature bits in favour of a function that performs a
   GPU_ARCH_MAJOR check instead.
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  14 ++-
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_hw.c     |   1 -
 drivers/gpu/drm/panthor/panthor_hw.h     |   6 ++
 drivers/gpu/drm/panthor/panthor_pwr.c    | 120 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  17 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  78 +++++++++++++++
 8 files changed, 239 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 02db21748c12..753a32c446df 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -10,6 +10,7 @@ panthor-y := \
 	panthor_heap.o \
 	panthor_hw.o \
 	panthor_mmu.o \
+	panthor_pwr.o \
 	panthor_sched.o

 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 847dea458682..d3e16da0b24e 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -20,6 +20,7 @@
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_mmu.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"

@@ -102,6 +103,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
 	panthor_gpu_unplug(ptdev);
+	panthor_pwr_unplug(ptdev);

 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
@@ -249,10 +251,14 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_rpm_put;

-	ret = panthor_gpu_init(ptdev);
+	ret = panthor_pwr_init(ptdev);
 	if (ret)
 		goto err_rpm_put;

+	ret = panthor_gpu_init(ptdev);
+	if (ret)
+		goto err_unplug_pwr;
+
 	ret = panthor_gpu_coherency_init(ptdev);
 	if (ret)
 		goto err_unplug_gpu;
@@ -293,6 +299,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 err_unplug_gpu:
 	panthor_gpu_unplug(ptdev);

+err_unplug_pwr:
+	panthor_pwr_unplug(ptdev);
+
 err_rpm_put:
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 	return ret;
@@ -446,6 +455,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
 {
 	int ret;

+	panthor_pwr_resume(ptdev);
 	panthor_gpu_resume(ptdev);
 	panthor_mmu_resume(ptdev);

@@ -455,6 +465,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)

 	panthor_mmu_suspend(ptdev);
 	panthor_gpu_suspend(ptdev);
+	panthor_pwr_suspend(ptdev);
 	return ret;
 }

@@ -568,6 +579,7 @@ int panthor_device_suspend(struct device *dev)
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
 		panthor_gpu_suspend(ptdev);
+		panthor_pwr_suspend(ptdev);
 		drm_dev_exit(cookie);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f8e37a24d081..5afa9fdfbc31 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -30,6 +30,7 @@ struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
 struct panthor_perfcnt;
+struct panthor_pwr;
 struct panthor_vm;
 struct panthor_vm_pool;

@@ -125,6 +126,9 @@ struct panthor_device {
 	/** @hw: GPU-specific data. */
 	struct panthor_hw *hw;

+	/** @pwr: Power control management data. */
+	struct panthor_pwr *pwr;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index ed0ebd53f4ba..1041201d83e5 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -4,7 +4,6 @@
 #include "panthor_device.h"
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
-#include "panthor_regs.h"

 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 64616caa6f05..56c68c1e9c26 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -5,6 +5,7 @@
 #define __PANTHOR_HW_H__

 #include "panthor_device.h"
+#include "panthor_regs.h"

 /**
  * struct panthor_hw_ops - HW operations that are specific to a GPU
@@ -47,4 +48,9 @@ static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
 	ptdev->hw->ops.l2_power_off(ptdev);
 }

+static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
+{
+	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
+}
+
 #endif /* __PANTHOR_HW_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
new file mode 100644
index 000000000000..da64fe006a8b
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/wait.h>
+
+#include <drm/drm_managed.h>
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_pwr.h"
+#include "panthor_regs.h"
+
+#define PWR_INTERRUPTS_MASK \
+	(PWR_IRQ_POWER_CHANGED_SINGLE | \
+	 PWR_IRQ_POWER_CHANGED_ALL | \
+	 PWR_IRQ_DELEGATION_CHANGED | \
+	 PWR_IRQ_RESET_COMPLETED | \
+	 PWR_IRQ_RETRACT_COMPLETED | \
+	 PWR_IRQ_INSPECT_COMPLETED | \
+	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
+	 PWR_IRQ_COMMAND_INVALID)
+
+/**
+ * struct panthor_pwr - PWR_CONTROL block management data.
+ */
+struct panthor_pwr {
+	/** @irq: PWR irq. */
+	struct panthor_irq irq;
+
+	/** @reqs_lock: Lock protecting access to pending_reqs. */
+	spinlock_t reqs_lock;
+
+	/** @pending_reqs: Pending PWR requests. */
+	u32 pending_reqs;
+
+	/** @reqs_acked: PWR request wait queue. */
+	wait_queue_head_t reqs_acked;
+};
+
+static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
+{
+	spin_lock(&ptdev->pwr->reqs_lock);
+	gpu_write(ptdev, PWR_INT_CLEAR, status);
+
+	if (unlikely(status & PWR_IRQ_COMMAND_NOT_ALLOWED))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_NOT_ALLOWED");
+
+	if (unlikely(status & PWR_IRQ_COMMAND_INVALID))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_INVALID");
+
+	if (status & ptdev->pwr->pending_reqs) {
+		ptdev->pwr->pending_reqs &= ~status;
+		wake_up_all(&ptdev->pwr->reqs_acked);
+	}
+	spin_unlock(&ptdev->pwr->reqs_lock);
+}
+PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
+
+void panthor_pwr_unplug(struct panthor_device *ptdev)
+{
+	unsigned long flags;
+
+	if (!ptdev->pwr)
+		return;
+
+	/* Make sure the IRQ handler is not running after that point. */
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+
+	/* Wake-up all waiters. */
+	spin_lock_irqsave(&ptdev->pwr->reqs_lock, flags);
+	ptdev->pwr->pending_reqs = 0;
+	wake_up_all(&ptdev->pwr->reqs_acked);
+	spin_unlock_irqrestore(&ptdev->pwr->reqs_lock, flags);
+}
+
+int panthor_pwr_init(struct panthor_device *ptdev)
+{
+	struct panthor_pwr *pwr;
+	int err, irq;
+
+	if (!panthor_hw_has_pwr_ctrl(ptdev))
+		return 0;
+
+	pwr = drmm_kzalloc(&ptdev->base, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	spin_lock_init(&pwr->reqs_lock);
+	init_waitqueue_head(&pwr->reqs_acked);
+	ptdev->pwr = pwr;
+
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
+	if (irq < 0)
+		return irq;
+
+	err = panthor_request_pwr_irq(ptdev, &pwr->irq, irq, PWR_INTERRUPTS_MASK);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void panthor_pwr_suspend(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+}
+
+void panthor_pwr_resume(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
new file mode 100644
index 000000000000..b325e5b7eba3
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_PWR_H__
+#define __PANTHOR_PWR_H__
+
+struct panthor_device;
+
+void panthor_pwr_unplug(struct panthor_device *ptdev);
+
+int panthor_pwr_init(struct panthor_device *ptdev);
+
+void panthor_pwr_suspend(struct panthor_device *ptdev);
+
+void panthor_pwr_resume(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PWR_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf8..5469eec02178 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -205,4 +205,82 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0

+/* PWR Control registers */
+
+#define PWR_CONTROL_BASE				0x800
+#define PWR_CTRL_REG(x)					(PWR_CONTROL_BASE + (x))
+
+#define PWR_INT_RAWSTAT					PWR_CTRL_REG(0x0)
+#define PWR_INT_CLEAR					PWR_CTRL_REG(0x4)
+#define PWR_INT_MASK					PWR_CTRL_REG(0x8)
+#define PWR_INT_STAT					PWR_CTRL_REG(0xc)
+#define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
+#define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
+#define   PWR_IRQ_DELEGATION_CHANGED			BIT(2)
+#define   PWR_IRQ_RESET_COMPLETED			BIT(3)
+#define   PWR_IRQ_RETRACT_COMPLETED			BIT(4)
+#define   PWR_IRQ_INSPECT_COMPLETED			BIT(5)
+#define   PWR_IRQ_COMMAND_NOT_ALLOWED			BIT(30)
+#define   PWR_IRQ_COMMAND_INVALID			BIT(31)
+
+#define PWR_STATUS					PWR_CTRL_REG(0x20)
+#define   PWR_STATUS_ALLOW_L2				BIT_U64(0)
+#define   PWR_STATUS_ALLOW_TILER			BIT_U64(1)
+#define   PWR_STATUS_ALLOW_SHADER			BIT_U64(8)
+#define   PWR_STATUS_ALLOW_BASE				BIT_U64(14)
+#define   PWR_STATUS_ALLOW_STACK			BIT_U64(15)
+#define   PWR_STATUS_DOMAIN_ALLOWED(x)			BIT_U64(x)
+#define   PWR_STATUS_DELEGATED_L2			BIT_U64(16)
+#define   PWR_STATUS_DELEGATED_TILER			BIT_U64(17)
+#define   PWR_STATUS_DELEGATED_SHADER			BIT_U64(24)
+#define   PWR_STATUS_DELEGATED_BASE			BIT_U64(30)
+#define   PWR_STATUS_DELEGATED_STACK			BIT_U64(31)
+#define   PWR_STATUS_DELEGATED_SHIFT			16
+#define   PWR_STATUS_DOMAIN_DELEGATED(x)		BIT_U64((x) + PWR_STATUS_DELEGATED_SHIFT)
+#define   PWR_STATUS_ALLOW_SOFT_RESET			BIT_U64(33)
+#define   PWR_STATUS_ALLOW_FAST_RESET			BIT_U64(34)
+#define   PWR_STATUS_POWER_PENDING			BIT_U64(41)
+#define   PWR_STATUS_RESET_PENDING			BIT_U64(42)
+#define   PWR_STATUS_RETRACT_PENDING			BIT_U64(43)
+#define   PWR_STATUS_INSPECT_PENDING			BIT_U64(44)
+
+#define PWR_COMMAND					PWR_CTRL_REG(0x28)
+#define   PWR_COMMAND_POWER_UP				0x10
+#define   PWR_COMMAND_POWER_DOWN			0x11
+#define   PWR_COMMAND_DELEGATE				0x20
+#define   PWR_COMMAND_RETRACT				0x21
+#define   PWR_COMMAND_RESET_SOFT			0x31
+#define   PWR_COMMAND_RESET_FAST			0x32
+#define   PWR_COMMAND_INSPECT				0xF0
+#define   PWR_COMMAND_DOMAIN_L2				0
+#define   PWR_COMMAND_DOMAIN_TILER			1
+#define   PWR_COMMAND_DOMAIN_SHADER			8
+#define   PWR_COMMAND_DOMAIN_BASE			14
+#define   PWR_COMMAND_DOMAIN_STACK			15
+#define   PWR_COMMAND_SUBDOMAIN_RTU			BIT(0)
+#define   PWR_COMMAND_DEF(cmd, domain, subdomain)	\
+	(((subdomain) << 16) | ((domain) << 8) | (cmd))
+
+#define PWR_CMDARG					PWR_CTRL_REG(0x30)
+
+#define PWR_L2_PRESENT					PWR_CTRL_REG(0x100)
+#define PWR_L2_READY					PWR_CTRL_REG(0x108)
+#define PWR_L2_PWRTRANS					PWR_CTRL_REG(0x110)
+#define PWR_L2_PWRACTIVE				PWR_CTRL_REG(0x118)
+#define PWR_TILER_PRESENT				PWR_CTRL_REG(0x140)
+#define PWR_TILER_READY					PWR_CTRL_REG(0x148)
+#define PWR_TILER_PWRTRANS				PWR_CTRL_REG(0x150)
+#define PWR_TILER_PWRACTIVE				PWR_CTRL_REG(0x158)
+#define PWR_SHADER_PRESENT				PWR_CTRL_REG(0x200)
+#define PWR_SHADER_READY				PWR_CTRL_REG(0x208)
+#define PWR_SHADER_PWRTRANS				PWR_CTRL_REG(0x210)
+#define PWR_SHADER_PWRACTIVE				PWR_CTRL_REG(0x218)
+#define PWR_BASE_PRESENT				PWR_CTRL_REG(0x380)
+#define PWR_BASE_READY					PWR_CTRL_REG(0x388)
+#define PWR_BASE_PWRTRANS				PWR_CTRL_REG(0x390)
+#define PWR_BASE_PWRACTIVE				PWR_CTRL_REG(0x398)
+#define PWR_STACK_PRESENT				PWR_CTRL_REG(0x3c0)
+#define PWR_STACK_READY					PWR_CTRL_REG(0x3c8)
+#define PWR_STACK_PWRTRANS				PWR_CTRL_REG(0x3d0)
+
 #endif
--
2.49.0

