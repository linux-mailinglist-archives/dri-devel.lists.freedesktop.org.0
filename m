Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF68D398C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB40F10E7B6;
	Wed, 29 May 2024 14:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="GE1TpE3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2110.outbound.protection.outlook.com [40.107.6.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C8F10E484
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz0BiGc4dUgdFSSIxInoggRrEQRyg9EeMCELzUR/ewlAFs3lf2RIdeRKagCvQYp62XH78lqURyrrdNWHJRouSdOsBjU0cGQAAwSW6CgveIVhW4+UQe8RhSlbCNos322TJL7q2Jy20C/yiuIgUu/7mSUl4Qt+UnYYJqBykYHmbCiOjqA/APAVPBZViuuQdmciQiCR0LhoR1t+qNeiqHwQX2dDi+YLKSSFMQ49tFqGpP7az9iFdMc5QP38GEk1yPIhFxJUhhwIR2WKrcR0B7wkpDY3G8oIlMskYfgluDu2WFlemW0uTuqzM8dFl61xHkg3jF+QJC4yhipwnWo7Rry4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn32+tMJ0dEmaEnJ9x3K5PQSu0DSMQcGVcLoYoN/GwE=;
 b=CfIz7PgaFSyzr0STF4InlO0z7+RfXgYsVcEHQzo8eUXjOmQonFZcL/vHQ/AsaNSFddtXMSmTGex3zGPO+WLkQA0R0yw+n2kf5TrhPXMzIFA8EsuAxx97FVA0aoHK/udFb9uqDLLHQmoLX6WT67XxbIwO1LEn2+3gNXqQg2iHnbKx1wa0LM4gdItLKN7LGH+tqRgE+2XxZztK5+S+kjZRN8FRunpFF2Cx+X1HqMo7pDuFk701P9aj8jMsMNPnlIO4Fp3CpbhjMSh7vAasY+VPouA9/9DxVUsASTZhR10SFzNfiGz7HYQ3ZTN0GiNGvFGOWrK/RoqSBUNxBqp25ZtjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn32+tMJ0dEmaEnJ9x3K5PQSu0DSMQcGVcLoYoN/GwE=;
 b=GE1TpE3E8D9m00fFVS68SqBfDUzjGApmcfqS5vYSutPoVgS41tt7rWiHXJ9qfeCR+XTECLyIJmEiMVUcx+OgwPFRyKi9oImZyFhh0p2k7x9uNF7YvovXT161/EazkHi+wN1Yn+q5mS2p8QxP75ygs/LF9JZc964vMqazKfZ58Uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4539.eurprd08.prod.outlook.com (2603:10a6:10:cf::22)
 by PAWPR08MB9032.eurprd08.prod.outlook.com (2603:10a6:102:335::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 29 May
 2024 14:42:56 +0000
Received: from DBBPR08MB4539.eurprd08.prod.outlook.com
 ([fe80::87a9:a8d0:96fa:19e1]) by DBBPR08MB4539.eurprd08.prod.outlook.com
 ([fe80::87a9:a8d0:96fa:19e1%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 14:42:56 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: [PATCH v2 0/3] drm/panel: sitronix-st7789v: fixes for
 jt240mhqs_hwt_ek_e3 panel
Date: Wed, 29 May 2024 16:42:44 +0200
Message-Id: <20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v2-0-e4821802443d@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOQ+V2YC/5WPTQ6CMBSEr2K69plSCD+uvIchpC2vtApF2wIaw
 t2teAKX3yy+mVmJR2fQk/NhJQ5n481oI7DjgUjNbYdg2siEUZbRjFYgpk6ZF9xC5EE/faOX0OC
 9wRSCGYztoGV5VaYFTQUrSPQI7hGE41bqaLJT38fw4TBq9uJrHVkbH0b33nfMyTf9p3JOgIKqp
 FQ5Frwsk8sy9ur35mQxkHrbtg/UhZgX7AAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716993775; l=1022;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=5r36wtFuMjOKdGbwbpGTJiPH2SBkc3GShmj39rlkRQY=;
 b=hPkq+Zjm30YOObk6q8ekZz1vcbtb87BBrR5CGQL3Og1vLAf5vBmv5RzO0zNPCW2Jfz4cb43it
 YmllavkiismAji7vKT+5oWYRayfED1T0VnqsDjsbSzTbhJgeZH32X02
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DBBPR08MB4539.eurprd08.prod.outlook.com
 (2603:10a6:10:cf::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR08MB4539:EE_|PAWPR08MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b86438-db53-4fa4-a3c9-08dc7feda0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|52116005|376005|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1hhNGkxVEVtcVVOdXkrUnRQTmtzOEVtdWhLb0pybkxPcC81Qk1zSmQxcTMy?=
 =?utf-8?B?bTJydENqdEFvT2tRWFJRcHlVMWx4N2U5dVl2azFIbjI2OUdjcVI5a2U2QTRM?=
 =?utf-8?B?SWpaZzZLdlJZQlA2VEh4QWY0RnlXUmgvd2M2eVA3YTFTSXVFeElFaHpmcnpv?=
 =?utf-8?B?MllNSlNSdkYvRkhXc1k4OG00NHRVelpzN2xta3hDYUU0S3orekRhb0lRRmJk?=
 =?utf-8?B?ZmhPSVVBTFhrZmQwUFpHUXc5NVpTNG9LMjE1eDh2S2QyNDV6QWpXN1MwTERD?=
 =?utf-8?B?MjRKazgwRG1XanpoekdBUmZtN1JaMWh4UjdabVQ5WGpSZTBiS3llMzhzcVk5?=
 =?utf-8?B?TTg1amdIcXdjWU5hY3JTSU5Xdk94Nk1KWkJ0WUxzdk9yK1NBWFkwYXFqbmZI?=
 =?utf-8?B?cHcvekNpNDZKbng5blV1ZUxnMU9hMENZYWg5SmlXbkpvdmRSZDBrQTgyMGhX?=
 =?utf-8?B?Tk5ZUm1NWTJJOEpKMmtCQnFKTmZsZnRCdXlqQVhQd080UlJ6dkpGTkRnenFj?=
 =?utf-8?B?VWZ4bGlrdTczVHROMjI0WXd4WDUvRk82ejNNeVo3WVBVRmFEUUVvMVMwUE1z?=
 =?utf-8?B?L3lZK0Z6TWxBWFVrZ2ZQSE0zRFdGQlQrbGQ5Y0RuR1VUSHBKVWFBVmdzTzdk?=
 =?utf-8?B?RkM5cVpOUDhvTVJxYnpSR0lpRGswTWxOZ0xxTUNXc1d5SHFoM2dUdm5Md1Ev?=
 =?utf-8?B?KzdhUHY5WWhIKzF6K3lLaEpYeVVocmE1c1ZvTEVUZjFLQzlVTlZLNWRkeE1X?=
 =?utf-8?B?Z3h1UmlWTUw5bHZHbmVTZXBIU1pFOVdzZFdNazJzSVd5N1QxZFRXRk5la1RH?=
 =?utf-8?B?aDhjVU56L0lmMVBRcmRXQmVrNm1FUzE1WXozZWhGM09Wb1Q4dTV2OVM2VXlw?=
 =?utf-8?B?SXVxRzJGUk9XRzVjQ2N3Q2tPMWswb05nVDE5SVhiWDM2WXExVXpObEV1V2F0?=
 =?utf-8?B?NUN6YVNLQXR6WlNEenNHZm9NTCtsUE9hODNOUURXREV6TE43YzN4K0s4R1N6?=
 =?utf-8?B?bzBRR0RMbXFKUTNQTWpVTHJ0NmV2Q1ZoMExnNTFnZHdiOWNvNEwrMWVLQXV0?=
 =?utf-8?B?WHFiNE1laEtKMS95M3JCZzVTc2I5R1J1UUNNRk9OTmY4TEdpYjlYUFdKZzE1?=
 =?utf-8?B?a29hcGRkbzdHRlBBdVRzbE1EM05XbnJwVkw0SHRORkZpNG10azEwRVhhK044?=
 =?utf-8?B?b2xmeUFvckRuVGZjQ3ZHVFFueUVFSjBLTXhaM2xrKzZIVlZpMjlPQU1iSExS?=
 =?utf-8?B?b1k2VUJLVUlONkovVlJKUC9ZeWFpUzZ1UWkycTI2L0ovSDdpSTlKWktvM2JB?=
 =?utf-8?B?d1JrZmFQbm5GY3dpRFMwb2RVanhnT2lQc0h3V2ttVFZqaElHZC9tYWl3U2hK?=
 =?utf-8?B?MlhnOVc1alduMTI3N1Z1YkozSGswYTlSay9FblFBR3phcWYwc1IvNFhpZ3Nt?=
 =?utf-8?B?YUJxSlFsZGxQOUl2MGJRQTdJUVd0UXgzS240NTFWL3NMWHVtZy9hcU4yQ3g0?=
 =?utf-8?B?MGczV3lGclVDVFJ6WU5FNy9RWDRHUDY0MjFmcWNyRWpNNDIvSXRVM3FHRVRD?=
 =?utf-8?B?L09OMEJZVmZ6VGRvUUxUWnpmcFFZZkVnYnR1NjJrWWpIL0dYM1RPREtKTUV1?=
 =?utf-8?B?TjdoTElaZkZLbzZZVGQrN0psQ2ZWMWxuNzk0T2FFRlQ0aE1lUFlEVUpDekZB?=
 =?utf-8?B?TWVBd2dMYVdMT3NsNXhxdlZwY3llcVAzdytwWW5RUTZ0b1ZqeENMRExRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4539.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(376005)(7416005)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXFRRTRMMlJFUW9PNjM2WS9tSy9RZzhsY3hrYTIwcTJUcFJJazUrcVRIMkNP?=
 =?utf-8?B?cFlsZ0pDUVh1Q1o5Mk9sa01sTkxSejkvbHpFZzdlU05wQmF1ZlJrUlROVlVB?=
 =?utf-8?B?SHFsR3FFd21NdGwxRlA0RnVvekxSMVRGK2lBOGRUYm9YZVpVM1lQOE5yaEJ4?=
 =?utf-8?B?a3Nsc3JLVk9zS1RNckFlME1FYzBuQzJmd2hXYTdiNHpYQm1Yc2dhYXhzNFdW?=
 =?utf-8?B?OFNNVTR0bTJYRkM4VlR1cFRtVXJvclAwcytkc0srRlg3TzYxSDl4ekkvajI5?=
 =?utf-8?B?eWZvVUZxNVByQThDbHZRdTZGT0FlYlN4QUtaR1BFNDNFbTRLZm9LMHNtTEVq?=
 =?utf-8?B?dmlJdlE3Q0JHa0dGa21WNEgyaVNIdUczbnpBU3I5ZW8xUzNHQXpoSGtqekxY?=
 =?utf-8?B?U29ieDFCSjFFSzl0Y0dteisvWDErRXp4YTZhb0NXamZoVTRHY29CWWpGZ2kx?=
 =?utf-8?B?VGMzcVJobEpmNlF3S3o4WHk0aVBFbjZSUVZqclVENEx2aUhhcXBTbGR6bHl3?=
 =?utf-8?B?bHRJSzRyMm5LQXRNVzF6TWU4WXZTSjYvamRpZVlqYWV3M2h4dzZ5Q1VqNmFM?=
 =?utf-8?B?UlNVUWNrSS9lWDdEeGFXZ216M2o3M29RV0oyNlVjcExVNHlkbithRFlBY3JJ?=
 =?utf-8?B?aENrRWUyZ0hFa0Y0Yi8vSXVjTFZ5Q3dSL2F4amloR2F5OGhxQ3lPaTJhVHRU?=
 =?utf-8?B?clJoVW5TdTRWejZ1VTRiOXRVQTVoZEVqVU9qdU9XNFg5QitwTHNPVkdBdDB5?=
 =?utf-8?B?SjZpMEdLMmdqMHYzVDlYSlJUenZVdm16VnlKZFAvQTVHQ2hmdy9uc2JVdnk1?=
 =?utf-8?B?MDhVbmlocVZteEtqQlU1ZDRSNjZwR3VoOU1wSGtPZUVmRkRiY1doZTEzQkJZ?=
 =?utf-8?B?ZThZTXY1RDh3dTQ5bmpnZ2tFdkFHVVRUdHJQQUdLK0J1YlJ2d0NNVnpwQ2gr?=
 =?utf-8?B?cjVkaEVJbjVEY0VSRjJZYThjVmhLWlFZZVJSVDNhMEVBZHlpVm9mQXQyUU04?=
 =?utf-8?B?NzArTlA0a3l6QWRxZk0vck5MbkZHYWNLajRSUjczZHgxbDVXYk5NQmJmMTc1?=
 =?utf-8?B?U0pqdloxQTJrKzJ4eFBRZkREa1VXNFlCVjM3SHV3ZUx2UWZCUm90elhzejJM?=
 =?utf-8?B?alExelNuamRPblBpaWNkRWdQR0FzRnBlNTVSem9XNUhYWHFBTjZidTBPcHBy?=
 =?utf-8?B?U3dsK0xMR0M3bzA2djdxNDVwR2ZBYVozN3hudTNpWHZWK01ScHBBd0JWRndU?=
 =?utf-8?B?Y0dCc1hzblJwMXRUY0Uxa0JCUE1BdU9vOVZJWktOTFJ1cDBjekRESGpwL0cw?=
 =?utf-8?B?RFV0eTdiTHBPby9jU1hwUnZnK09EenZSN3hpZDJaMzdGV25BM1RuVXA3OTM0?=
 =?utf-8?B?dHcvTVJmRWJ1OEVXbHAwdmo1NnpEa3ZPdzJpK1NkaCszQUJ1TTdvdVQ2WFk0?=
 =?utf-8?B?ZytVU0NGamlHOXpHelp6b3VJUHRxS2c4RCsxaHNwSFVuWmVHemRQTkIvdU1R?=
 =?utf-8?B?VVNWSWpEdFM2QklsOCs2MU5CTkNnYVdpVDZYb2pjcjhMbnZueitQeTZYK1hB?=
 =?utf-8?B?Z1ZxbDRjTXQ4NjNlTHVXaDNGWkdxUG56WklqcEd4VXU3aC9CQkU0YlpjMFpM?=
 =?utf-8?B?VlRVNm9Ta3ExMnQzdEJ5eU1lTFFxa2VPMytHZWRPVVNJMHVQRGxvYnBoZlVq?=
 =?utf-8?B?bkRBRzR5MlVYREtXc0hMSU1OL2dJL3ptOXpqQVgvQ0ZUTzAzaXk5NzhTaEx6?=
 =?utf-8?B?ckJXWFBVSUtkTVVKbUFDWHBoR1JUNXlsMmtGL2ttOGJnNmxFWVpRNUhGbDla?=
 =?utf-8?B?SENXS3VpZmhmSW0xeWl5emlndGFqSHFlbUNGRCtYNTNJOE9tait1T3JmQUd0?=
 =?utf-8?B?SExrcnI3bUV5aU5XWnA3YmZoOE1YM2pzdzJPSjc0dUdrUkVnM0tna1E4THps?=
 =?utf-8?B?b3FQREp5OTJneFVwejRtaUtNQ0RTeVFWQWZDbjRlczYzelg4dTZkNTlCU01n?=
 =?utf-8?B?UDh3TjFvS0R1eGJleFJBeURwZ3FSOGg5MDJscFBWazliUmI4T2FESHVCQU8w?=
 =?utf-8?B?UVlvWi9OL3JqWUtoUW02VHRvZ2c4cy91VzE3N1hnaDVFdk1vV0hob0tLYjJ3?=
 =?utf-8?B?MncvaU82YnFEREozNVQ4ejA3OGFpZWF0c092bFF5Q0V6Z1ZVNzNIUElMeDUv?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b86438-db53-4fa4-a3c9-08dc7feda0b1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4539.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 14:42:56.0709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3wpT9Ymh9/PVyDSIaC6KU1c0DBve2sPfopSK4kB9Z60nC1iJEoBKsH3z7iBAQpkJI5s5+jdRVXb/THidjT34lSVBTGMIAa3AK+QSCLvMFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9032
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

At the jt240mhqs_hwt_ek_e3 panel, noticeable flickering occurs. This is
addressed by patch 1, which adjusts the vertical timing. Patch 2 and 3 are
two more minor fixes for timing and dimension.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
Changes in v2:
- Added fixes tag to patches 1-3
- Link to v1: https://lore.kernel.org/r/20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-v1-0-f9ccf6e7a881@wolfvision.net

---
Gerald Loacker (3):
      drm/panel: sitronix-st7789v: fix timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: tweak timing for jt240mhqs_hwt_ek_e3 panel
      drm/panel: sitronix-st7789v: fix display size for jt240mhqs_hwt_ek_e3 panel

 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240409-bugfix-jt240mhqs_hwt_ek_e3-timing-d26983703b27

Best regards,
-- 
Gerald Loacker <gerald.loacker@wolfvision.net>

