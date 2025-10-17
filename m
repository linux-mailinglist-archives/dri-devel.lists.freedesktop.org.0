Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA104BE8122
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 12:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4DD10E088;
	Fri, 17 Oct 2025 10:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="muwhP3Jx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="muwhP3Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69AC10E088
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 10:30:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=scAWBNNvkAq2V1er94I2kFare/iFC8BlifQSx5ZRKVvTf3nEZ0ig2mbHMAbHoMRy0ZZPeOEUH/W9eib3uyxYKmKDamYOwEjaGDaJbzqEJskXv6SL7sqI1902dbA+Eh552n3hjWyYIVnE2Pen8ADcY+ES6PzHvYFWDm4qtC5EvJSml/XQqEUqGyp8qpaxSLji6qgwQ40w6dAAX2IHnJx8MXesXpkvjNR51cCG3tuEG6fimUo79A0G7mzXjVt7+PRkXywYXcLJR7UkWaoAaWp3Z/Lr6ILglYDXoR6ARpKNTdrWdUn6I4nvZy/rZF+9ZNS9myPaDocYvZdTs7rLT1m64g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOyGVBT6NPy90ZTcK63OqsyFS4FbVMVCfrio2uCxGH0=;
 b=lnaZtV+7rFNXgHJFetadKsFunDD+F+lZRdTeh2I1UbczcY3pFkBIeNTG0PVvDLVdfj6rR3dD8AJVYf0FTZb2WGQo4RImLgOpAUiKRwile14wObHZ5zgC3asSk1/W3o5SAqnhFKbyPSawhsDx5KXQr3ROYH0YBZiul44OPPvRO+oTxTlfc5X4MDYJPKfExCZsDQQmgped7kKTIvxdz3KKovoV9U+YDR9r+iWMgIaLE5JAimvixoOLOWSx6sN61mOn3PG2tqKdMmvFt7reiLtW3MOU0UJF9vvc5YdyyHwGYcJzvFI8iIGIsHJgv3g+NWTcMI0W334cy6JUQbs8HiF7eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOyGVBT6NPy90ZTcK63OqsyFS4FbVMVCfrio2uCxGH0=;
 b=muwhP3JxqrW4FDQSofBnlgI95aXuuk2Wf/CN0WFzEX9G+iuz/iWsIlMsgrcwqoGiwBUeyuxLzPTi0Nq2p/dv2V2uZwVmaRIQFRZQKwDUhfRCzg+YO/Ey6XdBdscrquGODlTMZalxXxtIUdP/tiwUcWOOUSsvIe8/dN0fZfabi34=
Received: from DB7PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:36::22)
 by DU0PR08MB8066.eurprd08.prod.outlook.com (2603:10a6:10:3e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 10:30:03 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::cd) by DB7PR05CA0009.outlook.office365.com
 (2603:10a6:10:36::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 10:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Fri, 17 Oct 2025 10:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDTbzAqQ/DP1rOj9Dm18mWbl+UZA3kVQx7vwp8/Z/U7qjvnR5vHhX7IasVeWcj4plIt5ee8yITUGLH9lXW9q/gg5fGnXq9XBDOm4s3vrVgj0Wv6hyhGFWqae3hWya532RSJuvjcgvyPLiVxCFyOQ89BmHoV+44gWWdiQY5Q6QytIg1PYqI1eQkpqAvexca9cEx0IfPYrXYF2lay4XMm6fHyi7ACUqZYxUxPtg3zK3CAHiUDhWiuT94crTiBUPFRZaOBh7h3EsDqQO6ZQDbyMicOKZDNfo/aHPEqeH9DgmGQBc2HWGGDTRBgmt2UoZCSvKDewb2BpmfPI33CiWLJNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOyGVBT6NPy90ZTcK63OqsyFS4FbVMVCfrio2uCxGH0=;
 b=KPZpUTs0SdnIPIdgrSIYF/9LbuMkyidO3mm8UtKufOS8DpLw21tIbLqxby+YIR1m9J+7aUgOs8O+1053loHgKBDmm5/UOH8eDuHHhdMgowgKgfa/ViAVVM7GK2+OlrDsgvAQ67udmrr9FO0uJFSPtiV9+t5mdQIc6xfITYk1ZncZntU5AekeUCFhiDdPZZP4PBVVLEWtJdT8T8dMSnQBGDSlnSzG+tbZSBAXH8JSGwDwBHkFtjNorRYGoPtLL2Xg6SKG8LxzByfcQS7YAc1lZCENX+6Al5uqtf31S5u0h5hdkQoZP4hqTlF1mZhqfAwpyRv9slSWJ/Jw7A3PyErDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOyGVBT6NPy90ZTcK63OqsyFS4FbVMVCfrio2uCxGH0=;
 b=muwhP3JxqrW4FDQSofBnlgI95aXuuk2Wf/CN0WFzEX9G+iuz/iWsIlMsgrcwqoGiwBUeyuxLzPTi0Nq2p/dv2V2uZwVmaRIQFRZQKwDUhfRCzg+YO/Ey6XdBdscrquGODlTMZalxXxtIUdP/tiwUcWOOUSsvIe8/dN0fZfabi34=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAWPR08MB10119.eurprd08.prod.outlook.com (2603:10a6:102:364::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 10:29:30 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 10:29:29 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Fix kernel panic on partial unmap of a GPU VA
 region
Date: Fri, 17 Oct 2025 11:29:22 +0100
Message-Id: <20251017102922.670084-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0346.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::9) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAWPR08MB10119:EE_|DU6PEPF00009523:EE_|DU0PR08MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: c5ce5fbf-9244-4202-e753-08de0d6821f0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?CodpXqfZJzgkRF0A6VYZ9cD86ZSHJ/7uZbgqtoRFqc4kGSCfB4YCZw9lt2oo?=
 =?us-ascii?Q?Njgd8qkd3mIQVJcG1gb5LhJJpn1/GR1zrMmavq1uQ1hgnRzCKIljBIpswxPG?=
 =?us-ascii?Q?VNiNbTqjmIHN+YNMHv+t2/nGPi8zlg31Ias+URyhNEUIYMhJ6k22cmDhGO3x?=
 =?us-ascii?Q?2ghbbC/EzCRFySXIEOUCb9LOue3s353I7MWrPyUrUqjSxp/W0suwq7IuPZwX?=
 =?us-ascii?Q?xU8DpvDOwjKJ1pP1i0x2R1hQLb8qXvZ3hvbAFER7Ggam9HU7oFwA0ygeNx+A?=
 =?us-ascii?Q?fw0/1JnVYDfG37eROnEd6vErcBLdjTnhYuhAeTMn+IpLVdOFECzEDYxskzbq?=
 =?us-ascii?Q?r7jIVo3CNZA3XPThKnVMc/3cARvSEipkSUNfcy0kan8pFA6iKsVLyvLlimOt?=
 =?us-ascii?Q?XMZHMwgfiir3e3mws3spYUAQUvWpwZ3YSggc5nyivdkMTcEczZsujGvaHqN/?=
 =?us-ascii?Q?wEXtObg8PV5wTCA/w+U6DAu1Y+/Nhk50Q+xe2cEF7sy23x1EgML3CC7fL+pN?=
 =?us-ascii?Q?kVeDUIJpGDQL4YFukfaSGJStbiP1QhfSb4O0OnbSvEeOC31qiqPk4T+VtcXX?=
 =?us-ascii?Q?Ix6M4THCVcDEa1KaOjTgpmcfHrABvlbV4L5BkY/c0A6q/GQFRRcGYoUPkAZw?=
 =?us-ascii?Q?9mdVPT979MZuHSOPpHPsWiYqWrdP+Gg9tKi2kqdCMi0zwlQK/g0KCqfZxq3j?=
 =?us-ascii?Q?qXT9DHF+iW3DEjo7XDxRzHhgm/LVEdw3PPOf14Oit/bbx9G4J7ExxgUS8wv3?=
 =?us-ascii?Q?3/QUaMP900kXvBlEPKaSryANz2gAxNe2rcwDKkK+i+/aVwpG/8tS4IacqF/Q?=
 =?us-ascii?Q?voX5fgbA7ppBu5TmKEUFdGnvnJyYMSte13BFpu5faG8Xl+byH6t+iyZZQjMH?=
 =?us-ascii?Q?bcOVn2TifPs8xGgiIQiC0GRbUND3N1RP9zpehrFcxpIqutzAiD19qPqKzG7K?=
 =?us-ascii?Q?A8m8lqOcZecweVTJofF4XknvsVNzwgVxpkv0hOWIEeoi/JzkkqkpPfz8vL7c?=
 =?us-ascii?Q?tohxE3sJNGGZ81iLNcPS/ISgsbhRXp3Rcng3zT0NWvEov29lyTUb5hNKCgQD?=
 =?us-ascii?Q?mqESITXoxlwsN/EaA6/N+20hQV5elx97vxBJJ4Ff/Itgf9D4YQmwB7M+FoiS?=
 =?us-ascii?Q?cN1aYfVfMaBIoHzAjntcg5bi46WIwC0VwymHkEVNp8E7phCV15XL99zxhjNi?=
 =?us-ascii?Q?4dLFJUu+Tq/xt//LnhrZXdUhjt1tfociZ4nrcnLJA/knGwuMTj2+7VzAg/Ip?=
 =?us-ascii?Q?nWcPx+Fj0bmhqDI8AwgxRcynXNnamWbPLYNop3aUrPADyhDMAKS3jBbpzLvy?=
 =?us-ascii?Q?J+Bm6nfnAfBnli87d11SZPpt6Pj0DUTCRHhKyoBLDLETp/+2+DZUtr8qOshE?=
 =?us-ascii?Q?0zxmvfQ58HJ4I7LUSxsU+FuFeRK8Bs60baMx8T6fW1ek4/ufHnTJf/HwsPxM?=
 =?us-ascii?Q?Q9JFL+ykxQzHrIkKJMGtpEuqf/zcdgHH?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10119
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fad7de13-bd6b-45aa-5901-08de0d680da9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|36860700013|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?81grmxXoniBTFrb1bo43Fi/LvXiBb+TM4ZghAz0pM1rpEQZcawYt3szIkBkg?=
 =?us-ascii?Q?iApR8Gi2xrVgs5sW6x49VKbwI6LYbCqe+6j8qWsogwm3T5P2c8eqNBZytex2?=
 =?us-ascii?Q?2h6bLzROiUuXea9/hco0iHzB0HYd29DG8b5mMn5+yqI0ncQ39LFsjOlOS3C7?=
 =?us-ascii?Q?lg96V4NHyXlMOeiJ0IPgx1a1HaDjQ3QvOckobLzPQCgF3KsGWLgNMCIcktyH?=
 =?us-ascii?Q?qsZCYnoHpOqKu3oawlkjhM6gS2Wl7eP6pliLc/SUrYWaOQoD54dq6M8/M6JN?=
 =?us-ascii?Q?rOuIFl9CGQYpYHsB9loygOV9Hvf98jFFmm6Ljwh4IAnjFgSoZONjFufcCMa+?=
 =?us-ascii?Q?WkAdVy1rKSgbBc9IXEWc107K7SIICsNesozaGXVnq8Bm2VKSsCywaSKerrT4?=
 =?us-ascii?Q?kcatuvJuMPOpKkSw93ViGI/3qTkpuuVDQMV4Qp19Zkzlfrwsh+3/SJC0QouH?=
 =?us-ascii?Q?wAAFCkuCIf3KMBLD6LvDHMDCZXSISU9eqlSlDonx4HwEV5JOnpct+nzcvyFb?=
 =?us-ascii?Q?qy0MgX00MtSSEZXb9J08vEeE9PSAMyhBSt648soxGeEoWyZASNGcsmN/gFoG?=
 =?us-ascii?Q?jVQN5jPwjWhgdvwr2sHm/D1c7lXOusOZf2Xay7bsNvEoVkLKcQ72busMxZi6?=
 =?us-ascii?Q?KAmh5OilC8aiSTlTebt+HMRc2Ls3fsJzCuZ3nx9D52ozDqbKNB3vNE5USwzp?=
 =?us-ascii?Q?yNOAA/9FiF7drpeiLT68CSOAEzi6WlM5zGaPCcd/Y6AE4OO1rExLOz2xIHAc?=
 =?us-ascii?Q?g4fL7GEWEbUzk2oRLIbonkTAUyLaGLj2MT2X4udYyRi6yyNQvMFZMqOCh82P?=
 =?us-ascii?Q?mr8NpiJs9+1ZcEWbF5in6xpuaWYLIC78FpAxi8fEObDcsGOh/WOE8r2JXZF9?=
 =?us-ascii?Q?TPqyd6Ux9GP60Y0lLRY3t2aoO7q3ziVDnHpVGM/CYM0JG+/MdQIg8goMLydt?=
 =?us-ascii?Q?MhMw5ccA3RcIQQQIqEKkiViqvYoeo5zwddvx26wPxu/QrUY2tYM1T19TbubN?=
 =?us-ascii?Q?CLE/6DzvmhMvKT7weXXO3Hb7gERZaWtrMnfs+ft4jgwiRhE4O+cy5aurLVu0?=
 =?us-ascii?Q?BP4wDvdoX52Q4u6tBUJXZ297x1ZMAkkhFLgM9wslXByM/2z1WcOIW2ZBHQMV?=
 =?us-ascii?Q?8YJ/IMGxtcRej37M6Zi4B+QVqkCBJTa4FMtx6yiSWwJf8s9wja7T6NAS8asu?=
 =?us-ascii?Q?MgQ2xrv4gUEze4y/kE2xNNTgT7qGgZb4jHEATHVe2s83qqgQjEeepvTvcNpG?=
 =?us-ascii?Q?FZ8pkOaV6kpwaukJnorDcw0beL0MejlYod1+cARH6GSGeJhwwTjbq7xadCGl?=
 =?us-ascii?Q?cwUx97FIRAuENKp1+9HwGl7dSWs4AQ0sNeQUf5gIvoAQ4/oC5OEZeVpBcfbo?=
 =?us-ascii?Q?u/dxal2IVW4QoiiGBP5xrCVHu6Azv98XuEPA9G1M3WugqqxOd+RTYl4aFYOU?=
 =?us-ascii?Q?mNCbW5Io1TMc43cG2HJCEAYjbzmKkhsa2fg1gTEDh4KcAcAyCqMck0hs6ExO?=
 =?us-ascii?Q?NdJ+ik6PGCF17dvGCVQ1Eci3koSnb2Sq8d5Kzjui77542+rf1jlnmO2BVELa?=
 =?us-ascii?Q?eJ9ICsDIcYBQXIjNZFs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:30:02.9397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ce5fbf-9244-4202-e753-08de0d6821f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8066
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

This commit address a kernel panic issue that can happen if Userspace
tries to partially unmap a GPU virtual region (aka drm_gpuva).
The VM_BIND interface allows partial unmapping of a BO.

Panthor driver pre-allocates memory for the new drm_gpuva structures
that would be needed for the map/unmap operation, done using drm_gpuvm
layer. It expected that only one new drm_gpuva would be needed on umap
but a partial unmap can require 2 new drm_gpuva and that's why it
ended up doing a NULL pointer dereference causing a kernel panic.

Following dump was seen when partial unmap was exercised.
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
 Mem abort info:
   ESR = 0x0000000096000046
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
 Data abort info:
   ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
 user pgtable: 4k pages, 48-bit VAs, pgdp=000000088a863000
 [000000000000078] pgd=080000088a842003, p4d=080000088a842003, pud=0800000884bf5003, pmd=0000000000000000
 Internal error: Oops: 0000000096000046 [#1] PREEMPT SMP
 <snip>
 pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
 lr : panthor_gpuva_sm_step_remap+0x6c/0x330 [panthor]
 sp : ffff800085d43970
 x29: ffff800085d43970 x28: ffff00080363e440 x27: ffff0008090c6000
 x26: 0000000000000030 x25: ffff800085d439f8 x24: ffff00080d402000
 x23: ffff800085d43b60 x22: ffff800085d439e0 x21: ffff00080abdb180
 x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000010
 x17: 6e656c202c303030 x16: 3666666666646466 x15: 393d61766f69202c
 x14: 312d3d7361203a70 x13: 303030323d6e656c x12: ffff80008324bf58
 x11: 0000000000000003 x10: 0000000000000002 x9 : ffff8000801a6a9c
 x8 : ffff00080360b300 x7 : 0000000000000000 x6 : 000000088aa35fc7
 x5 : fff1000080000000 x4 : ffff8000842ddd30 x3 : 0000000000000001
 x2 : 0000000100000000 x1 : 0000000000000001 x0 : 0000000000000078
 Call trace:
  panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
  op_remap_cb.isra.22+0x50/0x80
  __drm_gpuvm_sm_unmap+0x10c/0x1c8
  drm_gpuvm_sm_unmap+0x40/0x60
  panthor_vm_exec_op+0xb4/0x3d0 [panthor]
  panthor_vm_bind_exec_sync_op+0x154/0x278 [panthor]
  panthor_ioctl_vm_bind+0x160/0x4a0 [panthor]
  drm_ioctl_kernel+0xbc/0x138
  drm_ioctl+0x240/0x500
  __arm64_sys_ioctl+0xb0/0xf8
  invoke_syscall+0x4c/0x110
  el0_svc_common.constprop.1+0x98/0xf8
  do_el0_svc+0x24/0x38
  el0_svc+0x40/0xf8
  el0t_64_sync_handler+0xa0/0xc8
  el0t_64_sync+0x174/0x178

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e378..7870e7dbaa5d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1175,10 +1175,14 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
 		break;
 
 	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
-		/* Partial unmaps might trigger a remap with either a prev or a next VA,
-		 * but not both.
+		/* Two VMAs can be needed for an unmap, as an unmap can happen
+		 * in the middle of a drm_gpuva, requiring a remap with both
+		 * prev & next VA. Or an unmap can span more than one drm_gpuva
+		 * where the first and last ones are covered partially, requring
+		 * a remap for the first with a prev VA and remap for the last
+		 * with a next VA.
 		 */
-		vma_count = 1;
+		vma_count = 2;
 		break;
 
 	default:
-- 
2.25.1

