Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED23B7D7CF
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE6610E08C;
	Wed, 17 Sep 2025 01:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V8GIsGIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16F310E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 01:49:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY5mskGtI65jqDJk+toBa/48s8CU4JxXrjpXWG0n16tiGM4sGP7w+qFjPusVng0u1/XKS5k+T0EhUoY9v9fBgGICrL0iDOhsVceAxmLC4HchyxPY1QCS/t4Satz73bl2U05/Ln0TxmtD8RyZoF6jeo4s3zNqICYUool8HpDAA14cUJwmGti4YIh2qKY4YdRvmVcDCeuy0HTSMp/4hfwJsWqLHowdRSFfVggpN6Pi3UQiocXrTEgevw7XlNNBANLzhhpqAZeaAKtL4IY1WE4+gqnNsli2qszBa+rIDa8JLrzIBa2JfrOJMiDfFfWP7LhQtwvVr/jtYZdu92ffIm11/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki9LAGaCQtr7ea2ZLWTKc6Vz2d/i4psMMrisyliQyjk=;
 b=DFR/BdotEh9GJ79PJQDIYE6vTn8EGnN68q10ziLlYBBfL5KcuqCtLxObtE7Ix0jSe3hbn2QPEZDTju75NRhFM+MkwRdgg5tYAwHnglbj7yd0+qBZMd4YbZKGd1Lu/Iw/HSed9/bV/J7TxxORwHKy7o15oIkFMqfwEbtz0OC3ef9h18YwJHVY/ymdGwAl6HVFuW9YyuweP1XVkNjBmN6bYrnBAfifLB4BWcROR7Pwx5VQiQV9o2RQlUg4ZZcfb+MX4QUELchjxFrgvVVVMhXMxXgI6tdBOrpnjrzApDF2/fbNAVpg1i9LrmkhPi9Vrk58OHXpIw1ZXWE6fkANUKmwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ki9LAGaCQtr7ea2ZLWTKc6Vz2d/i4psMMrisyliQyjk=;
 b=V8GIsGIuyhY0743OzetEwDHWCXqs1LMWQp0o3Tm1MByCUFf99OVgml8GWJ1APsYLM4ZkVOGTl9kHhuFzl5kh9z8GQSVm6UT9wShkfl0nGj/NpBy23V6To2IJIVff5gAJptILpq+6eehRUI7S6p/KWTdJDhpMmQwaXXtTognhr1mk+k3EJ21svVCM0uJ0c5t1TyncukviqTp/q8CposG2O4rtKE734/+pnq++jwLN4v9FhSOI0vhYAzV7BAmPziDUzTUIaMIqO/wH+AeKnLWojkrA9Lu45FDY2tY1ne+AaRTAbG4HZuc0zkqnvVIxFQtAobOpHjGkP6gOyt+DiXOHYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com (2603:10a6:10:30a::13)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 01:49:49 +0000
Received: from DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2]) by DB9PR04MB9627.eurprd04.prod.outlook.com
 ([fe80::c5f7:3093:4ebd:1a2%6]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 01:49:49 +0000
Date: Wed, 17 Sep 2025 09:49:42 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: marek.vasut@mailbox.org, airlied@gmail.com,
 boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, p.zabel@pengutronix.de, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org,
 simona@ffwll.ch, sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <aMoTtr9KmdrgDUiE@oss.nxp.com>
References: <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To DB9PR04MB9627.eurprd04.prod.outlook.com
 (2603:10a6:10:30a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9627:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: d5238a02-b85f-4545-91f0-08ddf58c7c9a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S+MdyYYww8zStkZo23jHgOP4DRvyO4XA6ZMj7McBQPvBu1rl9sX2MUMX/QGc?=
 =?us-ascii?Q?77c0kt8R+6QUa7yY6OREp0jGs1luOxXiLNLWiTJSodNKhWfl8c4Dyos3rCg+?=
 =?us-ascii?Q?w3ijCd/Uwcm2iF+ymbFWOGiOir8+yewfk36H/6f/HmhNY7JsZwjTaTvLgDwr?=
 =?us-ascii?Q?Yz6cLPRMFNMPC+udJ4uH1YK0Aqodwz/0xO2FV1iK4OTI/YTOjeF1wVj3ROs1?=
 =?us-ascii?Q?2GdmAmCE7AywR3kEfkBtyZg+voMjknNvOMLrPaDiqTP6DwvXz3WmZxMTlnvJ?=
 =?us-ascii?Q?IP1p0NCZ2RxHojvCUc27YePdKmYWHexB96GJWKxplhY9DaD5FiuddEQCVmbs?=
 =?us-ascii?Q?9XSzo670aW5Cz7sWKRhlO30gAjsKi5YzjPUDnJ2LMa+LAQyo9kFlxQ8OAEnl?=
 =?us-ascii?Q?l6SwLPD4nyE/ght64NQiUzd4R3G5PpPBrsneKkUBuTD8+tqtVa1b4EmlAAaV?=
 =?us-ascii?Q?D6UQHIcGQoodmM7Jiqgc0LM59JPqj3lmizd/rP79yBF1Op2us4XQ1X+4WGBH?=
 =?us-ascii?Q?XK+gP91U+8FRjbbhlOisfv4pKlirJAmJ8o0upqter4aOxWG/keZmpQnjimOc?=
 =?us-ascii?Q?KJ0WiLvFEP5EtC+9TXLFf/XJGcBxfH1i9cdXw+RQclOAeyclKAX8aUaiQtdH?=
 =?us-ascii?Q?+QUDdt1A49dzeoYoGDgF9L6fzXBf4mkjHlKwr9cnsz7/sFq26CsTP0jG2WoX?=
 =?us-ascii?Q?DBUDbs0OMJge5KhFcVKWIIuMBvxYvyPRS5GvDx4vs2sBlzu7q2JT07wWqaGV?=
 =?us-ascii?Q?tkC6/kLHI6kxgX1Lb4FEx4y8w9srAVlP+4yrbuL6wjfZDtWbAi89QtruRyqX?=
 =?us-ascii?Q?F8l7CfWh/xTK4C8NMoGyh2AwLxY1rwKxI3NzYnLGDpPRVm8wWfWHjsF62F6o?=
 =?us-ascii?Q?wu6OUEDToG0KFuBMMxOG+F9CGB3Y/PreT9GbYwTmZIcg4mHUGHmHNZKzrUke?=
 =?us-ascii?Q?ty5cvsoWg8TRMvrr33NgTgFj1KtXswDIW87P7FhKvC/RSwzhejkMV3V9ltKt?=
 =?us-ascii?Q?WfvCA1wP0qf0KvsKxKbdNE37TQP1Gfb2Iufy2wpkI39TNbPUWWtI/7vfIy37?=
 =?us-ascii?Q?ibWQENSrX+U2tR7oS6KkRlTh0cREn74zJq6NOypitR6DQ+7UfUJDIqUUygsv?=
 =?us-ascii?Q?fTUy2htzMv1QpjEPCBKyttm+8J7VINWfO9JTRuOo94nAOLd1Tfbb+8QDbMzQ?=
 =?us-ascii?Q?8CTM2okt9JurDO1Hjcjlir+moIlVqObxisxdiOp8exMVFa+ZNDsOc9K3vp4v?=
 =?us-ascii?Q?Ozw5sA5Sd7inoMxSldPeCPMU3jZ5lNwJIeembfz+VRkub0oVwrqo/eL5Y7iw?=
 =?us-ascii?Q?CBoFfhZlR04n9MQo+u/nRqwei7PV404Y/8pkelVmAOS3MsENRejGO3wwiiID?=
 =?us-ascii?Q?jrOjBcT7QPdtZg7IIAZQat5jF/MyadhNkuimxMrJNhztvixP4BQOUilNbAbR?=
 =?us-ascii?Q?f/TmbAs6jpk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9627.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s1Oi+doAYQTXJhzQJNxc/af7BTxMVbAHMphaOWvZipZmlDym3Ucq609RpnE1?=
 =?us-ascii?Q?Ba7y7JSHDCc2eMos5syql4cTNwoj34e4kNhuyGWd7R576Ekf+VkjjbsOXbpk?=
 =?us-ascii?Q?lRxlp0LhdHLK/4HAbNfkitXofkPtQHbFMpTF+1SksAHbjfl6lQtxyccQ3yqh?=
 =?us-ascii?Q?JmtkEw3ZIIRn0+rkIjsBF11J46LzXfN4RmJiSmemW5osPnW7Xgx6OOrApBP8?=
 =?us-ascii?Q?1IjQhrxzteuX0t/aRKQnAwNLpLpePqn969h3ChDIZ25nFO/m+CV3BY9+ktb1?=
 =?us-ascii?Q?AE5EsOWBE7kzLZ12Lq6mtOLRDD/gdRJuJ2n3ZXMOqrxO0eIvPo2SjL7C8+Ua?=
 =?us-ascii?Q?i24WlccqK45FxRBpHWAWagGVtwfU/BlgK9vqYiZ7lq109Xt05rJYiGyJ/DA6?=
 =?us-ascii?Q?dSQS57+dw1jh8ZoahuEa9z8e1qdhO/5bmVghVkuryiKwnarFiUDOulTK0l6i?=
 =?us-ascii?Q?2ziRf9fdAjp/p9XMdo0IUrqCkI8NpNGRa58zvufAajhZvQHYu9YTL/j2EC7f?=
 =?us-ascii?Q?p3V7SOlPwDVEdiQk+cJxsMqnrZUeveOfHtSphprlMb5cjCKd6+iqDGDRAZmx?=
 =?us-ascii?Q?biNiSOQIqQh3JabR32WmiR2NOj+wG4w1FRoQWz2A0tzxTMGbS1dOTWOv32w3?=
 =?us-ascii?Q?iJgMtYnaErm2XZkvpThF8xVXt3LoXIvWiQMZFoy19SRfw0JTjmJS+OiiZnhw?=
 =?us-ascii?Q?ojcfbvb3195qu6N56gsqVrA4t6AE+fdoo5eZKF1ZLOzgnij+a+J2biHYtw5q?=
 =?us-ascii?Q?hmXwHMb/Xdi9bhFU2IQscfL8qYoeO4I7n4e4Hy24LZQVgdkLuTRdrmPM+6xF?=
 =?us-ascii?Q?P494gLsw0tUZD1Eoa4b0ySvejS0YymAUw9nJtX3BSDDXJMnjurW0cCKeewlj?=
 =?us-ascii?Q?1eQpbSFwIOUJea4X0SfdnUMl1w26hrv02Kk3jWbkLavRokL7ojyQM7y4fKPu?=
 =?us-ascii?Q?NYOMtN9bsSAOD11I07/BO2aMKEcrlP2cr9L8JdoS6B+uDXaYvlrgnFwIdCYh?=
 =?us-ascii?Q?fIFBuG6RMW18vchbQpMozMSGPHqONbED/LF5zwjw0vYz3AkT251Cq5Rk5WaS?=
 =?us-ascii?Q?IAeoLislnZZm5ZNTXW5c8hHhAvgp55LH+dacNnKvcUu3h1Sizcte5lDhApTi?=
 =?us-ascii?Q?FhI+/FWRJekHTfiZ6XJreroxw4zQfpprukR8u4ZrJwMnsQqibT65Wjv5sIYl?=
 =?us-ascii?Q?RrFsGj/1jMfMwjac3RII3wbc+BEqukFbypKd7m6NlbZKVDz5sdbbNu7EXKJX?=
 =?us-ascii?Q?SiIBAOH32qb00iYkpx+2qTPOqdkqbMx46xlCV8mcfHFrGlWqtJvpEafhrXew?=
 =?us-ascii?Q?y/78SZhJnL+YXAwPQGWcsxNuLw1hAlIz2azePTCPxZyrA1Vqpfknbm3qDv/+?=
 =?us-ascii?Q?Q6qwUxFrw0MGTYVg+Yz50RMLc+3IYPTbbNgVNAs8oN79eblKzjOaE8M6l4Eh?=
 =?us-ascii?Q?+d6zn/ql/opRBpnNXVq6DS7VuL/e0cbh0o8gCn1rdLWpzPMkb8EOGoNYc/3L?=
 =?us-ascii?Q?7tOJWAwwzOOzwRR8dARMQIh/BvUqmui5pLnj9XheAgGzFMU/iitZJDUKAUl8?=
 =?us-ascii?Q?h7m2HZ3gKuLx6bn+YYl4OYK4UhSkN4k2Hky9Chx2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5238a02-b85f-4545-91f0-08ddf58c7c9a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9627.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 01:49:49.3945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjBghZqime53r+aOQAf1Bx64WIgSzqKem+Dc0MKzm+sRw2e48NUcgQ6rNTUIxETTg4F04G4qXJ7Ad+L0uDA68g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155
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

On Tue, Sep 16, 2025 at 07:34:42PM +0200, Marek Vasut wrote:
>On 9/16/25 12:06 PM, Rain Yang wrote:
>
>Hello everyone,
>
>> you're right.
>> *0x4d810008=1, this register is a write-once register, so it was moved into SM
>> since imx 6.12.3 release, and latest 6.6.52 release. some document work is still
>> needed in the future.
>> 
>> Hi Marek,
>> thanks for your effort to make the i.MX95 GPU upstreamed.
>> I created one PR to support i.MX95 GPU expcept the multi power domain[1],
>> but it seemed to be placed in the wrong location. No one responded to it,
>> so I closed it.
>> 
>> for the suspend/resume issue, the panthor driver works well with 6.12.34
>> patched with pm_domains operation like you did.
>> run vkmark->suspend 10min in the 4th console->wakeup in the 4th console.
>> 
>> can you show me your SM version when uboot start,
>
>Build 470, Commit a07928b4 Sep 03 2025 23:43:49
>
>> and the G310 firmware version which can be found by search git_sha string.
>
>That would be 50.2 . I now tried 53.0 and I suspect something might have been
>fixed there ?
>
>As for the reset via block controller at 0x4d810000, without it, I get
>SError, so it seems the reset is still needed.
>
>[    2.788317] panthor 4d900000.gpu: [drm] clock rate = 800000000
>[    2.795246] panthor 4d900000.gpu: EM: created perf domain
>[    2.801029] Internal error: synchronous external abort: 0000000096000010
>[#1]  SMP
>[    2.808597] Modules linked in:
>[    2.811658] CPU: 3 UID: 0 PID: 52 Comm: kworker/u24:1 Tainted: G   M
>6.17.0-rc6-next-20250916-00076-ga73c9babac81-dirty #496 PREEMPT
>[    2.824939] Tainted: [M]=MACHINE_CHECK
>[    2.828684] Hardware name: Board (DT)
>[    2.834770] Workqueue: events_unbound deferred_probe_work_func
>[    2.840601] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS
>BTYPE=--)
>[    2.847545] pc : panthor_hw_init+0x18/0x620
>[    2.851728] lr : panthor_device_init+0x388/0x5e0
>[    2.856333] sp : ffff800082383aa0
>[    2.859643] x29: ffff800082383aa0 x28: 0000000000000000 x27:
>0000000000000000
>[    2.866782] x26: ffff000080034c28 x25: 0000000000000000 x24:
>0000000000000000
>[    2.873909] x23: ffff00008036f010 x22: ffff000081082638 x21:
>ffff00008036f010
>[    2.881033] x20: ffff000081082000 x19: ffff000081082000 x18:
>0000000000000801
>[    2.888165] x17: 0000000000000000 x16: 0000000000000100 x15:
>0000000000000001
>[    2.895298] x14: 0140000000000000 x13: ffff800083800000 x12:
>ffff800083c7ffff
>[    2.902422] x11: 000000004dd80000 x10: 0000000040000000 x9 :
>ffff8000809696b8
>[    2.909555] x8 : ffff8000823839a0 x7 : ffff000081082000 x6 :
>ffff800082383a50
>[    2.916679] x5 : ffff8000823839d0 x4 : ffff800081beb4d0 x3 :
>ffff800081beb000
>[    2.923803] x2 : 0000000000000000 x1 : ffff0000809a90c0 x0 :
>ffff800083800000
>[    2.930934] Call trace:
>[    2.933378]  panthor_hw_init+0x18/0x620 (P)
>[    2.937555]  panthor_device_init+0x388/0x5e0
>[    2.941812]  panthor_probe+0x40/0x68
>[    2.945383]  platform_probe+0x60/0xa8
>[    2.949040]  really_probe+0xc0/0x2b8
>[    2.952611]  __driver_probe_device+0x7c/0x120
>[    2.956962]  driver_probe_device+0x40/0x180
>[    2.961130]  __device_attach_driver+0xb4/0x140
>[    2.965567]  bus_for_each_drv+0x88/0xf8
>[    2.969398]  __device_attach+0xa0/0x1a0
>[    2.973220]  device_initial_probe+0x18/0x30
>[    2.977397]  bus_probe_device+0x9c/0xa8
>[    2.981228]  deferred_probe_work_func+0x88/0xc8
>[    2.985743]  process_one_work+0x158/0x3a8
>[    2.989754]  worker_thread+0x2d8/0x410
>[    2.993498]  kthread+0x144/0x200
>[    2.996722]  ret_from_fork+0x10/0x20
>[    3.000296] Code: a9bb7bfd aa0003e7 910003fd f9430800 (b9400000)
>[    3.006378] ---[ end trace 0000000000000000 ]---

Hi Marek,
sorry for the inconvienence. this uboot version don't include SM-184's change.
I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
or build from source, or raise one ticket in this website[2].

[1] https://www.nxp.com/webapp/Download?colCode=L6.6.52_2.2.1_MX95&appType=license&location=null
[2] https://community.nxp.com/
