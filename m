Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO6+ISL5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F67BDC0B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261910EA41;
	Fri, 30 Jan 2026 18:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oWk0KMa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CF410EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2W+SKxLOA5skTlJWr2cQY+ZGccf0G1ehvOInmD/chEdNj2meL2uCZIFQDzjOSNTq4MSoID0XIFdsCh38V3/ZZXeSenHB9NpoQbd+7fkfvxzGQP0E031GF0oY9jQPXroiQmi5lkAj7ECRc4KjMBt3WSaHs67/bTNavXaUIdtUgHGUsF6spUgiulx2fRohiNzeRVEFSuwFZYgHYxao0nAGfDunzbU4alnMMdT9GsVooSuoSuQFXT1FP8DOSHbcLennmcuZKJIlqVWDwQunuYvCQm15kQ+4ygibaxOe3aVmnSzW/dDa3QLL0DYkHruSyFrGQA0A+3WBoD4bR1YnEwVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iqbp+No0fp/RHVgCYXy/vvdna7OllVM7z5AQ5eboh4c=;
 b=UdDYc31hbQjDLyMHggNNfX1YdiE5T6CgNQ8T0sbw/jsabc4Wh6QtV6ErAIakYFFagRJfltM0dmq7rBvpdwU8P2l4VTEIG9F1J+T7qKo44cYcZJ6/2QJ4BCx3166rL/6RQIwNcLole5s9Owz2YC5Go5zyVs1FwWQg/KZ6iGfHTzrfYhuu3wd+MdkbRxqZUnnriqgYjEhieMuHwdpY3e5Hf7zqQ2Ph+K40Zz6HY5Ee4Uz+bh1ULZTp8A0imXbUwlfZBJBGkueLcmepxFAhO3zYat94jlWCXbaQIpa/W4lGZI+hbl0RR3w37V0+KAQrWo96pUDS19lu0A5XRhRMrhQE2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iqbp+No0fp/RHVgCYXy/vvdna7OllVM7z5AQ5eboh4c=;
 b=oWk0KMa66VYjupwiFrrh6oZmgTc6jg5qp+N0iuHyD53MwESltoLNA4bK9ekL15mNbW8mtt6mXy8r6U8J97h0b5SOtOUbOdAzybdbBwnnh1voLAdlQSan53EVlzLTCX4kxW3smNB1NROmwu1IbFL60nNGthIMHxDvJcz1bt5z9To=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:56 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:56 +0000
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 10/20] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/G3E SoC
Date: Fri, 30 Jan 2026 19:30:02 +0100
Message-ID: <2b15d2b2ef72d5aa420429cf0f1fd7bbfeb10e6a.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 928d2a76-1cb0-4385-b32b-08de602dd921
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qfpDOLFqNmNkoDaCRc7+TWFs6mwxRSTlgWJ7Xj3DpQjOF2wmMFQQdLu1b6Bz?=
 =?us-ascii?Q?KAALH5XCjh3u68gYYQ5CyWo+dgjKKZkzgNhJxTyoZfkj2ngW0E9zWG5dFVJn?=
 =?us-ascii?Q?cfe9u5qd2c5BfEmhYPAxt9tyBzkvqnMeUJ6mM7KwG94ng8IDqHwYKFy/5yDU?=
 =?us-ascii?Q?STVmVfYxRlgmUVh6Lc3lCWx7K92g8XKoXA0EjNBmwWrpOUdVUWbuztJ/jF50?=
 =?us-ascii?Q?8hDsrhTeqCumz4nPJFQ+ktuBknHfK3jEgtGWN4cow1uwtpgbJd3sTj4wa8jc?=
 =?us-ascii?Q?1OCST2bcpc3uBoGxeg5HpQYkqMRwf7uJgkByJQv67hDxqd1sXResNXRCWzWl?=
 =?us-ascii?Q?9TtKLlgl2/3e7bneA9jL2pqyefFpO5meo2YL5g3AMUlvNqk0D0J6L6vMwAku?=
 =?us-ascii?Q?ftAunjVUGzi2gzm4oanPR9LjYqSY771DEA0/pweTStnLaDsbjq6ROTYVwaDO?=
 =?us-ascii?Q?UsTuU6Gf/4Vjn2Uz62ZVFlAXOEqQsHmZbLG8CSJz5bHIhVvoK4lMTL32oaFN?=
 =?us-ascii?Q?clO/k/lA5kzZF18sYJCk7NYjf/jJVbqYRRYGl/Za08otO8ifN5hX9YKzMbx+?=
 =?us-ascii?Q?SjX0veMRUQaswV40DbVU9D6Pg2K08f+2ZWfDyBBAa7mUXAGSj5ghYT41yHyH?=
 =?us-ascii?Q?T9NOWPU4VwuXHx4dpOP6bc7yKIqwLHE2q+dcb0gDXTKavNMfS4HJUG4XV/cW?=
 =?us-ascii?Q?f7/I67xCW1201GlkKLcQKrTCG9yA02IKRvROt7v6ke90r1qwziMs75O1lH0y?=
 =?us-ascii?Q?3Ss22moCwsb0UWmDlXq8+PQWoLKtB/M/K5gCnYKtI+pi6nekMoOukDMk45GU?=
 =?us-ascii?Q?UTGR0zbFsvdPHaa9TtaWimidQR6EFVQET0Kfm8k7D/tj+ESTCpdTMt3v9NNx?=
 =?us-ascii?Q?z/85WDnmDTdRufspzmElbBZ9nSEwP4iWr2EBvTI1KbIsp5MRfYIBn84nj+Cl?=
 =?us-ascii?Q?lv3eSVRv8zATI5dnYGhKo+vXjLTtW/hmnADP//ZBD0T30qaK6a2FNrOZyffe?=
 =?us-ascii?Q?HtHuxpOi/w83iMIMc1+RGQdbOnR+34FuGkvOkVzmJnYLB3J4zz1Hqj9X38Qs?=
 =?us-ascii?Q?vJ/JT0ZZDntoZo/qcv9V01kaf9FAHK3iNQiEO6QQaep2CJZQxK0yX9w0JcaJ?=
 =?us-ascii?Q?pmG9BTRHKeMU5nKzs8RtlpWJHSQjSNR3xjjWsVqp/nhf9BbVK5er84dPlFUl?=
 =?us-ascii?Q?+XLyUyy6hRc1TuPc5NF2sen2KhahIj4Py4x/A3Woymu8eotFIITYDY7/cm55?=
 =?us-ascii?Q?6HzQ3InVIA0qU/zVlj6PzS25wCYq9fzlO8CtB8MLpBzs2aSgM/GgZHOPAmUb?=
 =?us-ascii?Q?/awYuq/vOuD6KAMjfhvoOsn2wbvXy0UP9kkNV+uQshVQscZVUOsR08owioTX?=
 =?us-ascii?Q?5SLf/nYFNDsYlTb+xxoACqnmsQ+irVaXpvAjqGcPhcukInMPnL4G1l6h2Ruj?=
 =?us-ascii?Q?hqzNRw9tWBuuE1VUnDDKqkZKq5c7a9FlJ90fQdSnabYgB1o7vwT30kQZhJFd?=
 =?us-ascii?Q?e+5bCthsaQ6mH6sCG6o0gnwzx77pV4uHu9r2sm7pVMpqVfex4hhk2w+gDZ/z?=
 =?us-ascii?Q?iToby8pgNyjq22VWtL+rdY6SQgFkQURHpZJ/n3Rb5MPSpIxoExUKKseX4wuv?=
 =?us-ascii?Q?xSy6qCBAqStSz9B7mRBnoMs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eufaX43igOLBg44Ft17Tupc+ZV030zHp9jUz32H1eXM1Z1Q1T6SepjPmx3Vj?=
 =?us-ascii?Q?38CSrBhV1oZLDPBUrk2ByGGILGFRujsBwxAbSsLBVwQptc5SG+l5BHGQQ30C?=
 =?us-ascii?Q?+nK9K0XJnMkM0F+kqztFl79nlXn27PnR73i/GFjW2BPSIBO+O4S2ElrWS5ob?=
 =?us-ascii?Q?8onu6NT9cg2JgTpNYqlEm1ZUi312NZNnw2UbuIzshcinjY0Bw2mv/lzQQSHK?=
 =?us-ascii?Q?cvXp+RKHiyc1FWtiqXQbFn9IX7e1DOhnLqcqGKDgTQClJQH26EtU2OphvuKk?=
 =?us-ascii?Q?8TiQti5/oyw/NSROGiC44Y/21rt14Q9aZssMKtHNr/LVOrM8iNf7KLlrrqDC?=
 =?us-ascii?Q?bcHVj4f2+6jnAbVSKKlsDgcC/ppPqMfJJBjW+e4yf+04zHdHOTsWivLOMfPx?=
 =?us-ascii?Q?Qrn2EaRLCH/tsarAA++Q9CNst3R5Fh043xNKyWMaAptCkqNox8OlurLREe9O?=
 =?us-ascii?Q?hILkhU7gujjvduogFPbsRqmk7EB/HDTYrwmjkejKohKW56IQjbaPB6D0cWu+?=
 =?us-ascii?Q?uJrHqgILbIs8bUx5LFH5h/W+UwVdR44FGo9jn/Nu5JXMS2Kct5wDW7wBDk3s?=
 =?us-ascii?Q?O1YDcvgiyIi8QRV8/rshqT/dKkInlsqcgrAWzbzLmT7F0twGkuYfHixFT8OJ?=
 =?us-ascii?Q?TRjqo86Liae5nh1CXHUqAjKoTzKUgm7d1jfd57t+qHdpSmVH9PIQEgFKhdfe?=
 =?us-ascii?Q?bgqbS5suvk8mOWb8U0BIVIFjLrBrXj+vPIrd6wuvKoyLbc6s29qD8A07MPrs?=
 =?us-ascii?Q?fkNtoMSnN0ydKMI+ocb0zL/aSGwDezp6fPt//m9WNbglJzbl8tcsMlq7K8jx?=
 =?us-ascii?Q?wS4vMbdMwpTTEhETCubRu5S+/3Tg/tZke4wyJu93wiK3ZiAfxxthwsp6ID7k?=
 =?us-ascii?Q?DIFvoFOKZ/RIVrbJniCBm9fI7Jp5JHcScuWC94ku//SeqtDeCOeW41los2Ua?=
 =?us-ascii?Q?qFf4Fo0i0qR7nLP9RF+J7Atuk1HkFVkPBMGPclUo+639wTQOLbjFh4UWVCS2?=
 =?us-ascii?Q?vfJyKqXS42DL5ZIonhwBsghTKi7dNUiUtOg2vQNmDxPWj636jNonRJ3TpBbB?=
 =?us-ascii?Q?N8eiffOCJQ3gxnGf1VtV2W+xyASUpjSbk5qNPH5lR9Mb5t8ej7xDSnWJBppi?=
 =?us-ascii?Q?BZYS7aQUAQuxK8axySctOhLSSyUoY/pI6thIKgnkEDeVO+AORCo0ouLNyCcQ?=
 =?us-ascii?Q?uwNwxzNHduk5U9Vh28RD2DSgPRXKyZV1nI/aFgjx1xjM0upAFo9OeI98+ZBi?=
 =?us-ascii?Q?dOqyO+gYQUlrISPbS25hpyK7J23nz/awp4k+W87Qn8ZUb/KZZLTi4+ARMqW6?=
 =?us-ascii?Q?AbJGu3OygBC9NDPsbwUGEiDtYjDZnnl75R5AHNEFRHMPnLxTkbu6eyYtB2EJ?=
 =?us-ascii?Q?bVISaduPMBUDz1ez/h1vFBzvI9Fn5I6vgDYMpCBHOsa16h7TkfuYaczvndgh?=
 =?us-ascii?Q?0CaHJVlPVoSjFDXUX1P/en+qOA9xbBKwe6Yy3cfmTHaCN/ixoIgMsHiFhQl+?=
 =?us-ascii?Q?xYiqb6QI+I1xpkGn3eAiMGtiXFfJTmfwbMuwZ1jUF8cDBGAsvCPMDPlVfY8J?=
 =?us-ascii?Q?h/1dBXindvZquNce2Rlup79cwxNsa7CRQxF4V0XL73rqbJN6oHw0ULWxIuUZ?=
 =?us-ascii?Q?qGA+6PxyZ77/wxz5Jkdg8OmTbj2+XXQ0jsEfRuL8i9xWIh5xT5UI8Y6mnUdy?=
 =?us-ascii?Q?MiZG5A9JWU7x23XjKR+mdeuJcHyjAHp+Tuji45FzzXrfNqqvi2jQycTBDRIj?=
 =?us-ascii?Q?mc1pHpzIkh8c12ZFljYBpB+yMUsz9RHiekImbBn4RIG2r9rAI8tx?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928d2a76-1cb0-4385-b32b-08de602dd921
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:56.6697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYFE9xp3caoW6n77ImZRgJmvbAFTC/xIgfTKSsPI8LT1ygrFAFxUnqhGerbjZOrHVoykVfBETUwa483EolSSRa7JqUN2Khj1f11r0GLjt6C1yzDd7GHy88bJP3lv3cNj
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,bp.renesas.com:mid,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 13F67BDC0B
X-Rspamd-Action: no action

The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
or vclk2 as DSI Video clock, depending on the selected port.

To accommodate these differences, a SoC-specific
`renesas,r9a09g047-mipi-dsi` compatible string has been added for the
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Removed oneOf from clocks property, which is no sufficient to
   differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L.
   In particular both RZ/G3E and RZ/G2L have 6 clocks with different
   meanings.
 - Use the already exist vclk instead of vclk1 for RZ/G3E DSI bindings.
 - Updated the allOf section accordingly.

v2->v3:
 - No changes.

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
 1 file changed, 109 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..00ef279129fd 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a09g047-mipi-dsi # RZ/G3E
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -54,20 +55,8 @@ properties:
       - const: debug
 
   clocks:
-    oneOf:
-      - items:
-          - description: DSI D-PHY PLL multiplied clock
-          - description: DSI D-PHY system clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
-      - items:
-          - description: DSI D-PHY PLL reference clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
+    minItems: 5
+    maxItems: 6
 
   clock-names:
     oneOf:
@@ -78,12 +67,14 @@ properties:
           - const: pclk
           - const: vclk
           - const: lpclk
-      - items:
+      - minItems: 5
+        items:
           - const: pllrefclk
           - const: aclk
           - const: pclk
           - const: vclk
           - const: lpclk
+          - const: vclk2
 
   resets:
     oneOf:
@@ -136,13 +127,6 @@ properties:
                   - const: 3
                   - const: 4
 
-            required:
-              - data-lanes
-
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -164,33 +148,123 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-mipi-dsi
+            const: renesas,r9a09g047-mipi-dsi
     then:
       properties:
-        clocks:
-          maxItems: 5
+        ports:
+          properties:
+            port@0:
+              description: DSI input port 0
+            port@1:
+              description: DSI input port 1
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: false
+            port@2:
+              description: DSI output port
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      description: array of physical DSI data lane indexes.
+                      minItems: 1
+                      items:
+                        - const: 1
+                        - const: 2
+                        - const: 3
+                        - const: 4
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+    else:
+      properties:
+        ports:
+          properties:
+            port@0: true
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: true
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL multiplied clock
+            - description: DSI D-PHY system clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          maxItems: 5
+          minItems: 6
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
+            - description: DSI Video clock (2nd input clock)
+        clock-names:
+          minItems: 6
         resets:
           maxItems: 2
-
         reset-names:
           maxItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
       properties:
         clocks:
-          minItems: 6
-
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          minItems: 6
-
+          maxItems: 5
         resets:
-          minItems: 3
-
+          maxItems: 2
         reset-names:
-          minItems: 3
+          maxItems: 2
 
 examples:
   - |
-- 
2.43.0

