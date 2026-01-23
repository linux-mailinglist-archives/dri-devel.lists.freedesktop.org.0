Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NZCGlyuc2nOxwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:22:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C678F6B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 18:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020FA10E2D5;
	Fri, 23 Jan 2026 17:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="U4gJDbYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022073.outbound.protection.outlook.com [52.101.101.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A22210E2D5;
 Fri, 23 Jan 2026 17:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsCE2O4peFXbDREmNTK/oWcUvRswdD5+A+YUuhytRJXR6RADva1e2UB8nKmzeKkvbGd+x+kzDazqdmd91HSWMPcLz568nVwCwVgZoi8DbAxG0giwdUOv7qtnslK81ddeYqSvJ+vvOMUG51gqDM35koQiBnRE5S4uF0+LTFcqys3h9S7aUfwUvd76s4xoI/U4GRA1JZvDq0FlApfLfkgBNb7exslpxf+3eFLxiWaLoaiE0P5MwggKNv45WvseGzdSYF0lmnAmSfC9nzTuIcERnhgfOZr2AYa9u5m0SWfFWyXj1iJtKpVqHgnfsku3DKhmO8THZHA8xhyka1mM3LMzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHm+rlGzuLYaE1VzbvBNI4D0SsQTC6Qs6uu7L1fzp1U=;
 b=TJsiNm4ypWmuXz5VCvp5ErqthNREe3wKV8N3PuehcwGuQLsgtIvNpX9ratSS/5VUP9xWAat8db7iS8P1ZnZiOTFPsxQQ7jw5VlFATXp3XxaLHEhVV4cncVrH0D+IVQMOtmkm1If6NxeBTdeldm1bg/lwup+D4ZMQGjUvmhVVGUEC9pF/DQou2CRouXBeQDyNhLBitn2r7G/YRGhugP+2R2zfOrYslFXtwTTfTsvZt1DBGCziepQ/axnGt7g21jMrzow4VMw+RjFkFp6EWa4uj1npTswDO3t0bRuJaQ/cbbdGggmHucM1XHdrcZZyiVQautmiASJ1lHNnRWezgNPsHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHm+rlGzuLYaE1VzbvBNI4D0SsQTC6Qs6uu7L1fzp1U=;
 b=U4gJDbYeh03qGXaIC3isKC3Cj9h8PVkVhMwwKladwUV6X8fJ7L5zq+rq9H6g1UPdmgBqzVe/7v8WRkiKVve8IpUPrlpb18Hf5dy3SLa09uR6Oy/3DeSIet/yn5J5gmiR+IKP4MIJlLcgv+PaDfedjnZx17P7Ek8UfGUKyOL96vY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7833.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:39f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:22:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:22:27 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Timur Tabi <ttabi@nvidia.com>, Shankari Anand <shankari.ak0208@gmail.com>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
Date: Fri, 23 Jan 2026 17:19:40 +0000
Message-ID: <20260123172007.136873-2-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123172007.136873-1-gary@garyguo.net>
References: <20260123172007.136873-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fda25a6-992c-411a-901d-08de5aa3fb44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T1P72eg9Hjc/cdC+v8ju1jYsV+VaqZJKst2pG3Ql5ZXzjgrOIyiKjmFbTMLy?=
 =?us-ascii?Q?uQ4lggSDn5wRIRM3qstkrjZtQZ0tu2EqCKOCq1Ys4mk7Bt6SDE1VUtsdqQ/L?=
 =?us-ascii?Q?VCagNtrD+37yxrZSMycLPJPV1oKT87/Dd3HF0pQWQ2AVtoigVK07fyzhXUpr?=
 =?us-ascii?Q?Lueyan7zF/QXL1Ku6n3X61W+DSgmGLK0gP6T3qn5KXegsfD2yqM2IMn2MzQ1?=
 =?us-ascii?Q?i3sV0LhI4B17TjIoePnlObdw87GfrHV9V50HaiHe29kFKVQHHzksfAl3kQvf?=
 =?us-ascii?Q?14ETwHVABeaApHwB4dH4V0oAjMrvJ0ROv14ZqDN9CRaHJzL0X2JZZPYEgUgQ?=
 =?us-ascii?Q?cwOqD/t6svvb/IEhfP7e+f4jLsbq8tJMmS/j3aDxdNrBA5JHiTtJ3FY81Zpt?=
 =?us-ascii?Q?aRvgf49xTAcJNiLFP/u8qavYMAmr1eYx6AiX+46wfELsfLCL/GZEz6WPQB8H?=
 =?us-ascii?Q?/ETQ/JKhSlfOZpjIHBtkcTOZStNJoXFp2XQlN9ah9QHDEm0qp483zIL+3+h4?=
 =?us-ascii?Q?Aj78ShZxuZbj+DEC+x+otJNk7NPRNoQmUg9LlxTbyZg2dC8pOakJX2/u0vqH?=
 =?us-ascii?Q?3+vKc8IUvu0YB6Kf2iA9YjqiR3YqKn/cMsL6ul4JFxpW74S47/eHpkvN2+uL?=
 =?us-ascii?Q?vYJDvDm/cirHYMYzBR2EytbTqpUmnWtMcjAbptGZduv77rCFQpm8kJXuvEH2?=
 =?us-ascii?Q?LgHW5tWexXrENQ/IeFH9V+TtfgWIn7+n29Uyxzvf4pvAyAdsSsCTO/FU1tFN?=
 =?us-ascii?Q?QX0QJp50gJds/fKYh/HuexJN/YIkDh74VGPKckIbsDVfHC0qyuZVhSjAwpPl?=
 =?us-ascii?Q?00p6oIqMLIMavCzEJnJjqyu0PaIS9VSPl5Y9GZKYcZCcAR//VURk4nh83i9k?=
 =?us-ascii?Q?1zHNFtyg7ZBG0kdt3ONuyFns4OYGfY3wGUntrD8Qea0on9HuhW9vA+2FkZ36?=
 =?us-ascii?Q?c08WW9o+EY+I9qA3OvbFXAiB/QlLmUTELY3pVPS9BENFgAmwoqGhNr0PA5r0?=
 =?us-ascii?Q?JVldKxgklwU8YKtsSilvnrIByOZoLkEjKCbCTepadxtCC06naNH1Hh+9rZg+?=
 =?us-ascii?Q?seVc7UP3+gMUr+kXfWNtB9AJ1d1QgOLCOrJoul5IjbU6emagrxxifDO+PCme?=
 =?us-ascii?Q?xUDTd+qtXeLVvfPtm4grNN10Kuz3kxrqnQmsQjQ9FrA8t0zOlN+Z2Y89tA0R?=
 =?us-ascii?Q?PoMU74atUW/Ntm/x74hMvhAhUyueI82gEOeh4m7glpiI9lXUi/Cc8bnSyi5j?=
 =?us-ascii?Q?qt69LuQaun4chkoVgoTzLvETCyzZQ704q6wibUiseODS20m0wgbWmV8npau8?=
 =?us-ascii?Q?SVjCLwRDa+NgTe6gyA7CLwGS8gLmKjSDNc1uP5GPHRE9/FMDjoFezTJQ8QCv?=
 =?us-ascii?Q?GfL/lp3ervFI6aOg02zWPHyJasBhHRXXMlVAxibWXoES5dCa7xqvarMY3/42?=
 =?us-ascii?Q?4X8aG7fxjIWUdks3KihkWLlXyvcFB4KNLoe1NjjuVRtxhrElkqyVix0KvX7J?=
 =?us-ascii?Q?N09yg2PBnOlld4Y2vLZ32Xfpw3C60urzfIa6b3rMqFXaHn/Ra+r8LKk04GWh?=
 =?us-ascii?Q?HHtVtuskItacVwHOoJwIMumAYjkVwVpNO2XEg1qo2cNHVQHmjoGw71grNRSf?=
 =?us-ascii?Q?BA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?24/g59HRNoSOYRdAwfagb3SFoRwpJFYRelzmrTBqi4bKzqSyCm3UyXiAVUWP?=
 =?us-ascii?Q?+4JK6kkSqn9f+tphsrCI/P4hh1nO8N5Jitz+nU5IrkpRb9YtQ+/sQk2aUUYZ?=
 =?us-ascii?Q?KAxuVxqWOo3q2sOEF1pFAyjFakxCC9Kb9xuhUQHgPiubaFTH5eur4WoAol8l?=
 =?us-ascii?Q?OCuvUrPWdY3b7wyIfSiyh0iVqrotEGFLbCUwzp6O+FjxCat6wCtNujx4/xl+?=
 =?us-ascii?Q?UvHXYojRptW1m7skWetLCynT3oCLgCIZrsJnn81qMVa9CMdYqGwbqyAlImNN?=
 =?us-ascii?Q?KCTcOZIJWM2bhNWbl6utL/vR0tfiQilT3NEaElmdpFbc+4iEk4GxOl9rAbox?=
 =?us-ascii?Q?VyBKl8H/xA5R3UZy43FXNGCpHHgh2zBO1JFLX6p3om14ZXjGXkYTrj3y5w+/?=
 =?us-ascii?Q?pChmhgDgnPT44L+bR7aB/rSVP5TrYmDgQ4u0akOn0rQ2Ng2jGMn+/AY8cDw7?=
 =?us-ascii?Q?sUDXxyaIow37ajs+6Y9W2z2JQRGcLiwANXO5ea307lXdBwoFmi4/gqApwjIX?=
 =?us-ascii?Q?Z9DjkFHe1y9ebHaK6obgSvNFqixMNe70e/G+J8J+7VbgeodZHEf9eORp6YG0?=
 =?us-ascii?Q?ivmx+jsV+ZXzMmpLOXJUdIqaqtGggfPBwxXPosSrvqgkCzgzq7+7ClL3JTdQ?=
 =?us-ascii?Q?/tdMeFp6fIcyQiq/NWp9fUpBBDAOSD2yxFwBnrpBCGvusg3kZpnVRH5yDhAU?=
 =?us-ascii?Q?QbCuVcGmdZwFcckvVyLm9/OLlaJQUja7D+0IwDuNupYy3JRV4O2KJoumzZK3?=
 =?us-ascii?Q?cvwtHakhlI1hDJtJyAkyNPRocirIYCJApUjMqEM8B2D600QQIgAGlhSPfYx9?=
 =?us-ascii?Q?zmQ+n7wo2WKL368d5AvYsjAhAsgeH8awjPtcXxZvRjw/3jfiPFrK/MdC46GE?=
 =?us-ascii?Q?7VEEd9JJjue368EpiVdqlLyeOHbwdYHdXxZ+xgOYhYJQlBjR1MOflo6RCMoB?=
 =?us-ascii?Q?+xiqs4OqEwPi2TBOmkbjEjM0XTpBPBr++YTfYaxMHfRTYheqbQK/BLliyM9N?=
 =?us-ascii?Q?8GXjr+YBcza/IhIX1ZGu++qTzyQFxN5iz1VcmzBxtvMtQxu2qcqr/1u/fsdc?=
 =?us-ascii?Q?cMNwkVhuoI8ZIbd15Mwx99XAEyFjad9mZqlq1WutdLakoOv1P5FIygxFA2L9?=
 =?us-ascii?Q?MkPHiL523RvxleVCYUmwCoJwH+/TMnuZ/xYTVsS7+HqzAz5i//eU9RSG/pOb?=
 =?us-ascii?Q?9aDae0MLys7MyMp8yFa1FhuougtRWq2gQKHTZ5h+Pevjb8zrIyB+oqEIbu6W?=
 =?us-ascii?Q?mMVDliEfFdzvsGDXyNMVzapOjjjHkLYCUrWAxXaBhuLuSYhBZBe2+nbT58X5?=
 =?us-ascii?Q?ruK9fdcxSZqkIGZKCltTUUgm5uHcV3sGJUTldtKc/lLerSvGUa9PRH8R7lms?=
 =?us-ascii?Q?FLONZNEg1bVgSaOXYHWzJQlCcssKVEZL4MBU0ZZ0PR07ggo1B00xY0ikDYmZ?=
 =?us-ascii?Q?uKhSWzu3LTJfq5iD6vGdeB5ZHM74rBk3LP+/vBUTNu79tnIcvTz9AGUxVx6g?=
 =?us-ascii?Q?nvBEL3oBWaYzP7tueG8QmQ05f0W8SA4QWIt69xyQ0rRJsbBafra3VCneb82M?=
 =?us-ascii?Q?SzKAnNUtV4DPuQ5uZFGgsh0jQW6/K/k5Jw3YvftPHDbTmfwa5VYHElzIXV4b?=
 =?us-ascii?Q?fhI0iXbEqUGp1n4XwqnNZRNGIRweepnGiu8H2IdArvBc/g100/47p4OCNix6?=
 =?us-ascii?Q?dTyPcYfcuop1DJWG65kRuobfX0ghdUPC9md80cbm9JYL5Ne597VrD+mA+ycg?=
 =?us-ascii?Q?umw06Gha6g=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fda25a6-992c-411a-901d-08de5aa3fb44
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:22:27.5500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHGYFS+tsbwj3nR4Rau6/Dl6meGRXdSULT65GyrH4XJAoEOPZTegyiLRjxp9ATE3CA9o4zFmrJaJh4e8m6+8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7833
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,redhat.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:dkim,garyguo.net:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B13C678F6B
X-Rspamd-Action: no action

These imports are already in scope by importing `kernel::prelude::*` and
does not need to be imported separately.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/firmware/fwsec.rs |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs   | 12 +++++-------
 drivers/gpu/nova-core/firmware/riscv.rs |  2 --
 drivers/gpu/nova-core/gsp/sequencer.rs  |  8 +-------
 drivers/gpu/nova-core/sbuffer.rs        |  5 +----
 5 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..dd2d1f0f24ed 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -12,7 +12,6 @@
 
 use core::{
     marker::PhantomData,
-    mem::size_of,
     ops::Deref, //
 };
 
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 1025b7f746eb..f0f18166849e 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::mem::size_of_val;
-
 use kernel::{
     device,
     dma::{
@@ -34,11 +32,11 @@
 /// that scheme before nova-core becomes stable, which means this module will eventually be
 /// removed.
 mod elf {
-    use core::mem::size_of;
-
-    use kernel::bindings;
-    use kernel::str::CStr;
-    use kernel::transmute::FromBytes;
+    use kernel::{
+        bindings,
+        prelude::*,
+        transmute::FromBytes, //
+    };
 
     /// Newtype to provide a [`FromBytes`] implementation.
     #[repr(transparent)]
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 28dfef63657a..4bdd89bd0757 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -3,8 +3,6 @@
 //! Support for firmware binaries designed to run on a RISC-V core. Such firmwares files have a
 //! dedicated header.
 
-use core::mem::size_of;
-
 use kernel::{
     device,
     firmware::Firmware,
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index d6c489c39092..c31b245acea3 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -2,13 +2,7 @@
 
 //! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
 
-use core::{
-    array,
-    mem::{
-        size_of,
-        size_of_val, //
-    },
-};
+use core::array;
 
 use kernel::{
     device,
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 64758b7fae56..3a41d224c77a 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -2,10 +2,7 @@
 
 use core::ops::Deref;
 
-use kernel::{
-    alloc::KVec,
-    prelude::*, //
-};
+use kernel::prelude::*;
 
 /// A buffer abstraction for discontiguous byte slices.
 ///
-- 
2.51.2

