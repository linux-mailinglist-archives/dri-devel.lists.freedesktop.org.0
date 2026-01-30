Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAMzKUf5fGmYPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A622BDC98
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7C510EA43;
	Fri, 30 Jan 2026 18:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LOkwBqG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010056.outbound.protection.outlook.com [52.101.229.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E810EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:32:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgxD+DQIj6yv4CmLpBEKSLpB+4iFPrWIG5x7enepJ6igSnIlrJil0fBIgHogdnHMWhbrUrT8hFG08l5ujaku8nKnOmWdU3qiOxuj6g2l8s4E9SIogvm3ix1IMorbz4WznqcnVmWwFGViu0GLyHLe75AsH9EFuncChjR0hlZInHHpp1rTtJibD67v85/Uz2YzID6QEvjMFxGkMz9humGCIJ1kjsbWJYiPBeu+6iEgAQd4kf9o6ORcZwAKtgfqZky86ZR+wTyIf0jIJdUx2LossCjId4UtpYNAr8NDPUgYNvKY0jNedw/27XBjleBUrGsfl5OANOiNgPpqH1J4VhdSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTDUf6epGfa7iZEygPftr5gohYpyyYCTF+9mHGcoNWA=;
 b=VpS6LvgXS6nE4QI4/1a5I1KLUeQ0jimHECKtX2R6XlicQSQ+GAeXdbC9WNQvrIeyHXMCDwlNFfQZM7n75QkmIvlrnShDOLL+bkE2feCxn03gR3Pq70TWYT2KXWvfLz5PxlxCiDDPlVKLH2zgzV3WH9C011dRafulbE12nhybFZ7CvVmacI9cb61ihVPR1oDWv7UwFW0ejMxmEHJh8JLQ+JADBYkGl9ZTa+KTYeGxjjH+ovhpT7JVaSo+klYhCva711prZHhAv+kbvbo9eom/j2yTv9K2KkSCHTABs0o9hKp7IZaCIQMpfoGWTyrtcTHnaKZTLd1DUz87MgPTvAlzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTDUf6epGfa7iZEygPftr5gohYpyyYCTF+9mHGcoNWA=;
 b=LOkwBqG4rK8K0QAEZuodOEMGn+LnnQELXHLqu7dCQELNlzt0GJSyyHyxZjAd8sPTwQH/1WZvtNys+Bjq8pbySL299atkKOyhw55iuTtuVTjAX4UEoRsxCSDvTMF9Sc9Phh85urZe501Kw2+t5sADYrm086yvHasvudlA+x8+dqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:32:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:35 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 15/20] media: dt-bindings: media: renesas,
 vsp1: Document RZ/G3E
Date: Fri, 30 Jan 2026 19:30:07 +0100
Message-ID: <81980c405d208e6069b9f9bc7a7429f838e0f5a0.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: f652ed07-afb2-4239-f9ce-08de602defd5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OTSpaIii/i2RJsj6pnec0dfkl2S4qzRa21sbjDvBqG7lRKkV2Z4gyoDB9gkp?=
 =?us-ascii?Q?VLQQMRgEla7ZviA5X6YB6SQ3OJ9Z54joGIoHoNAMaKIPSqf9gWn21bqhaaZS?=
 =?us-ascii?Q?bCqQXK+oKLqn/n+kxDjtpvwfV3yZ9dsnox74MtGLhJ+0iHfD08He8FuQ4R8T?=
 =?us-ascii?Q?sBa/ALs5HogPFQW/HUsCNleqejonq2nlSn6whtuOGIlCnwLjht91T9WZbkRe?=
 =?us-ascii?Q?tfdaBeFPVtPEQgqkiNonRIfu7jRJz9KZM12WeYmyp9Y7Ew8EX7RiX1pCAMCH?=
 =?us-ascii?Q?yHjsGjcDIGMZ8qJR80Vvx4LUeSH7GKt7FczcJQPqkmqOXbLTZEE3RLr0WO/B?=
 =?us-ascii?Q?mXBDLZk0GD5Uj5iE0grnNirCZiT9IzxJxJixAC7LcHh9J+7bwHpcU/583rHY?=
 =?us-ascii?Q?34ODqqferQYMylAJIRaahyYTu+pKY0jcOniLJE1G01sKOfJpCd0O0XAulh9E?=
 =?us-ascii?Q?8FTFaqqyl5jmCHuqpBNGBIGC6KGAgEYTA4+QKX4MqFNIqiLlhRillBgYjmpc?=
 =?us-ascii?Q?P4Umm0qJRgoqqLJbtRCyN0wQpt2AkPeOioKGnIlY0nKETwJtN8TqKdZGTNFF?=
 =?us-ascii?Q?JbB9nHlLUpc6bFP3Gz4K/gD+nIdBFZ8//lCI2ghmR7IgNMc0VZ5MHZEI3zxz?=
 =?us-ascii?Q?VSyoNItCX9oUneSTdgY1IuCOxkhCrjQoyrChuZgaxMFuYj7VgcdV0yqmCBQL?=
 =?us-ascii?Q?+OIUO37wM9/PdRsoWfQcvZ3h41YbSG/xxI/wOhTSE4ZCvko9jSE/K0H+Y3QQ?=
 =?us-ascii?Q?8k/co0vm57rx7QGnysthuwPy1HsBcoBqUKEGToOHOw0XVMYx+VOI0L+o7d/x?=
 =?us-ascii?Q?bJsyzRQ1zds+Lt9vF1nPAewvm3Vla8E+SpyjSCptx0ZRAoxPCB2Pvbtw4wyM?=
 =?us-ascii?Q?FveazlBZDLJP8w4pdyj5UIWEHvly6LYfmQFQNJGm/fsu4/6oe5SVTTx/nXZU?=
 =?us-ascii?Q?9crI1NLijh/o5NZY+wgKEE55TGm6u1D0mp/G3bjsX7hxCFfe6YhQFZqxhPZi?=
 =?us-ascii?Q?EG6NhjxNR/SF6JHYeMf8o2KjBLdZauHo8hxkoUmKvLAXh1yxYMeJMxLcGXWC?=
 =?us-ascii?Q?EuCm3Z74B5opQERtV+Bqp0bZKWXCMA9u1/pvlBgQDHlBM+hOy4oHmiIunsr9?=
 =?us-ascii?Q?qztpcV42StodsZ5wNXNv9d8bvWQHQZO+t8j0VGf3n4x4yhVeNIbQhB4VLFzt?=
 =?us-ascii?Q?vhLhjMB8zY5f72+zBXnYx/jHpWwsrizBMVN7q9n5DbM4LsSMtP1QpdYkoXaD?=
 =?us-ascii?Q?Vx0AX4jaE78BkpvXpoZKxJdWyHlyMqTbJb2AYAHpYo/JuE9a+PQZWHICBQ9n?=
 =?us-ascii?Q?5+uhddXb+cBpdBx3UKjm89NIfNy91BSrNgkjTxgBYjfhJLiKP+1C2KPMZGzs?=
 =?us-ascii?Q?ccMQ0lhkfbljo49h7Re8/ugNm6/EopYn2tLsYRtPz6fIVOVryKcZV2/9aybc?=
 =?us-ascii?Q?m9ESz1mHZw1lVN5ZUN+s7H1oF14YXHfs4jprcK+tTVe6xbEZOxGqne0ZwBkZ?=
 =?us-ascii?Q?PE1zrYTpQOHv/4WdSVQ+zNkXnMJmCrw1+EBxf2HQdCIwswcBeAq75adwBrw7?=
 =?us-ascii?Q?sEfRiK8ijHRkJCF3j3seSveP69guqUYpkxVlbQcnoEBUGv8bDT/Oi1nltNus?=
 =?us-ascii?Q?p7qpbZg12NuwWE4pOE62FgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3/KUhmH1X1pNBhnKqBOEKtPqSFq4XTRusCR1avu0BlO2VMIXXhjxQ5NXChuC?=
 =?us-ascii?Q?eRSLUlpW9MmwiJbzSmgskGMB1XVS+UjHGwhOP48TQrBWqYYXtq9tuE6QyU8d?=
 =?us-ascii?Q?+gAxZJ9MB+utWrhAk2ligp3InjQ68mrsMSdyjf3qpd0h6iXsFN3PkP3wTdB3?=
 =?us-ascii?Q?h7Y8ubVfDyJB/MXUuMnJxTJxdriRVnChZJKaEWs3cUUDEuXcqDv5Zz0s9Q81?=
 =?us-ascii?Q?G58DS7BBt6jhGV6cax1C+Yj6dtTVTFXHmVjJybL3RzKSSz+DFD7gDbCSYyqs?=
 =?us-ascii?Q?jtMfJYRxZURISL785aQ7+3F2RxJt7CkUnKkS4omgkziCApr1tzVmTtkU7zJ4?=
 =?us-ascii?Q?WKQCvbyiIoQywPZ6Us62nT2VMvniGswt2oKgHYaOlLTHguWEIAkMOg1wLyFv?=
 =?us-ascii?Q?HuDSqFd8dFKskGD/5+p87HtarzsxyzdVTNAx4tLQoCRMf4L+ak9vnXFOHG6M?=
 =?us-ascii?Q?UTAXaEEY9wN54uw4hdTBJw2GBnUExwzpH+XQfalbOLL5SFiL50faxx4cCt1r?=
 =?us-ascii?Q?MHnV1cYdIwxzh1jxu996e256Ds0omPKNpu3lj5eZKKTYIpEEGfzX7hgZ8Qoa?=
 =?us-ascii?Q?oaLgnf+btfEzNGXkgVO8Qi8eYxX2Xm61Kru1xFtB4veltTM2LQZh7hBoIlRd?=
 =?us-ascii?Q?BB5WkWJmQCrWzn0G3Ygo6k5UmjIdtOBqfzz5mf/127Jhz2H50r5qHagFcGp7?=
 =?us-ascii?Q?3NREvZDQ18RsGgQKsl8QXDud03PQCR8eVtbsb62QTAi3nF3QZraPhmA3HjZF?=
 =?us-ascii?Q?9RTFAV0/po/7382HhlGWSBNaJPbPY3kSu7MYRAAE3MzaRJKXaQPnjndne5rb?=
 =?us-ascii?Q?bDAxf4vlMQfYYS1PFxtMV5cDeilWZULeheC4Djens3Pvcg+6BuY28DI+m+Zm?=
 =?us-ascii?Q?gCYxdawkQ6E3HV5LQrH3EE6k+R7TqlmcwptA+NO92f4t6oK0j5rsC2Ju12h4?=
 =?us-ascii?Q?X4iLit4Tw5+cy4KoTyCVWcSkd8qxFcbZloHklDCpoPblyfMO34HkyOArk9YZ?=
 =?us-ascii?Q?mrk+d69hts1oH7NPCgc9MWW2HBPSJ7ckUk79NIsR3R5X1kTjMEGxMSHlKJd+?=
 =?us-ascii?Q?vAX3OIo2zRTl+DQJi1mEus6ly6SAOzXFtQTUuH7ZAa7XJT99zfRmA/85kjqZ?=
 =?us-ascii?Q?EGc/dc2xBlB9XcV8reqVWcIL4DEm+eVWMCAbUrO3WJnTgTNxLxPt51TsYp8V?=
 =?us-ascii?Q?xbkuIGY28+9RElE2dPRMcuPctlr1Jhple9bf9AIa7pOCznbzeaAfxoOU8fKv?=
 =?us-ascii?Q?EaC4AcmG4QCD9mEsl/fpxSLVLOdW6tBGPD21MIOSXa9kcZvxXXsWrIcSZ6pi?=
 =?us-ascii?Q?kOxawsQlPKoTjRDI82yu9nK+kP5f6jZUG0ccw+vVjUY2LU22nwIAnjM/35x9?=
 =?us-ascii?Q?5MrXZEaJlBCu/WA7BDRKtCHD8Ug84ivZ1Gle8c/vvepfNaNS9e0I7zPmhI3N?=
 =?us-ascii?Q?QVIPU8ZglsO9UccICFW7C8KX45c9MDkOgnTwK0U2vuBqSysQEMYyQvvrsQBQ?=
 =?us-ascii?Q?eOi4N3q1yrXLCkBwuBH4zuMUxGTTd5ozMnq0fe6gpbqAwDStKpzM0oAypbml?=
 =?us-ascii?Q?y7Cz+FY7Zc/U5zZ+JAyRRHknUN5kHN4UumSXoZLItnYH12H+1C5EXeED5bBG?=
 =?us-ascii?Q?gi+F1VrBWSylaSim1ijq6dvyCKYcdD2Rbm+yzxuii5h7BXXJUyKjuTIhuruX?=
 =?us-ascii?Q?3fUF4X0IR1IlNLeATOq8f//G7I1GVlOGDF32CoapRAXeETl/k/jA6FnBHgoP?=
 =?us-ascii?Q?AY32PRWgbiVjcbAKMxMYj6Y/RKXVlRaYa3C2TSH6xaQbJ8MomY+q?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f652ed07-afb2-4239-f9ce-08de602defd5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:34.9462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JLmifK04i2MESDE4ci2Z7ASYc0kWyvxIEA8CZQW37KObLfH7Cjaw3vYoSgDCzp9zO76+9nJTOuFq3PedR+EiGjviG+17UCuGF+7c4XMnrHXkKxXjFM5L67BMwyCGhqC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,qualcomm.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3A622BDC98
X-Rspamd-Action: no action

The VSPD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

v2->v3:
 - No changes.

 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..62bff3ce3eaa 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0

