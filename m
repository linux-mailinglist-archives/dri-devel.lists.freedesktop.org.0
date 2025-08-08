Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC85B1E502
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 10:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE2A10E1CE;
	Fri,  8 Aug 2025 08:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="APw8oI/9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013029.outbound.protection.outlook.com
 [40.107.44.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF7010E1CE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 08:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSvFgYP64C0WwLyuh/U1jBBaZhhEnXTB03oeHUH3x6eq/AvO9M1xE53Pl+4f4f0Gjf6lGRKt62zTMUgYXcarRXOtSRqNucSrlfNR3KRt2tbmH2RxPoDv/4lCXfbjImTFnKlgxws4szW+7cyeZzwdIMpDVf0gZyZc24ZFKpumKGqAV//xa8c/TnFl1vc/+ng3G7ABZiMVoJIt2rL5JSD/reg3Of7fboKQ4/HNXSSVBAxxEwOPmVcPS9gWq9W8LuhccO3brS15NYYA4MuwK369UUaRtoqz90qWQ6q4/U6RPm5pKIuUjq+8hZGB5/HAeemdxjazoAp0pxJkzP/PsyO5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/olyKIRYpqhIQf2c1ZYza/+yRyfvu4YuTui9YY/r/7o=;
 b=CkYVyJsojlUkWeY9ShP+xOe6OuLONbyAUwT9TulKwV+kV2H6iKtpHBLSt4EH/N9P0pPoFp1XlHB7/QwlLHSURGrpapgu++wULdAshTi5wc+p9RL9Hx3sUMYlzohe0H46S31B0o+3Zab4o3ocB4gOSnRNqvO8ELW7LV9QOUR7/6ZWfItvQEUXDqlreNJQq8gkrz85JuV7ozfM48Y9slwT5APszXUCmHmL8UlwCNPZhnB4xhoIznqqgsHCUXMf5fc6O0MDsrWjkYsfM7NZo10y9kmOZS7Ze//blHCmLDhZpaULgKo6JKrZUasqCzCdapAAIjWwVM8ncXeWpYEBxYIcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/olyKIRYpqhIQf2c1ZYza/+yRyfvu4YuTui9YY/r/7o=;
 b=APw8oI/9v0PWmBeCuwEj5tUGDTLUpAaraMleg/y2Y2ly9VxQ/YKc8aml39eTrEskUxNuJv4s4pewlA+Q+XRZCz4viXcIvNUzbAyuabcGj/VqzDZt3E8gYJiwrTUeWgqiyvynm8gJy/3F4RZKfwqo8a6QNrOvuxl2aEZN2p9UlRVp8vCgTQ3uOmseU5Dr1FABECiN6ww/D60R1gaOJak9mxdOcDSVN/XCinNb3JoN0Fa9+9uJVMYuNxa7ynGacmroo7rDIBiO0ED/GGF7dqu3mW4V5jD6tUGrn4v8rInaZqSjnnUoe1RQZoE3R5PCnT5kK6zGIlr8n9B+bwEcDAFRKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6238.apcprd06.prod.outlook.com (2603:1096:400:33f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.18; Fri, 8 Aug 2025 08:55:40 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 08:55:40 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 Farah Kassabri <fkassabri@habana.ai>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] accel/habanalabs: fix mismatched alloc/free for kvcalloc()
Date: Fri,  8 Aug 2025 16:55:27 +0800
Message-Id: <20250808085530.233737-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0211.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::14) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a9465a-3693-4259-ba1c-08ddd6595993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vyyUOqGsigfjm8yAw7BmeDe5wkldippa2rRdq8atW3OLZYBAhRuYgRn4RHmQ?=
 =?us-ascii?Q?T6dzDzPpdexEkBwKgl5/n8Jxvn2rNfvxPMRGWs/2lX0QYgsR9mSgCMbPYQ4h?=
 =?us-ascii?Q?VbsinEmLU1wPYTHI/5s51W8qbNlcehrmmQ8lb6V/FG7qomsQkDZDKLBpYXAG?=
 =?us-ascii?Q?GE/VMxw6tcsorWnV/CoTA0zaqB3OzqwlBKt94L9oPOpmQYrwL4Pqyu/cHrB2?=
 =?us-ascii?Q?lzNoH1i9lMJkbi4H+0FSdrBaYhJxn+0LQJvylm+qRubyUlKlJzc9WGCETo5J?=
 =?us-ascii?Q?A8sh1iitS1o+ESYPChDjz2iRMqyijnR166AZ65s0vs688jiClQq5mjO9NM6z?=
 =?us-ascii?Q?ah+DUCnMcFUNY4rR7F7gLn+3xSgramx2UWJkC4QJ7ASDTmi2W1QFm3Mt+Vtz?=
 =?us-ascii?Q?Epc3G0caa/ijGU8ekrSHvrUDtSE2K1kSfORIUrSSHhoCMiWbKZy/KBC56jCy?=
 =?us-ascii?Q?AI0Pk8fDl8Ieb7S2O4bylA8Q5mc+HssXL6rfSiJJws0237BYC2VXdIlWjvNy?=
 =?us-ascii?Q?Fkb0LVSQ963LDStaKrtOef61ehReTFfxu38dn6D9AC8Do4HYIQiiyEHF6Kot?=
 =?us-ascii?Q?6Agj6lXYjlClu5TnkcG6GE5PQl/5ko0ZMRss+7p5DB+Sv7gjvLQJ/W4rsZ/y?=
 =?us-ascii?Q?A4OdofczIli4ZVVP5is0NgV3H9WEN2VmBmxDNzCqlX6TV5GNOPDQkBoCjXYv?=
 =?us-ascii?Q?V/JOtakvRJ8eRcM0JCWj3i4B4Kx0U5xqITJJmmUbIXo693Fvq+HGG2PhPRRA?=
 =?us-ascii?Q?1/mGQXjbeGtxIePh0xgoMD4Z02kIyrTTQGoCQkwMK9Rgpu19DE7rqubLI304?=
 =?us-ascii?Q?nTbo5HdFD9ewVKlfFDFJLEB9CZeDg4cSKtf4mVZliuqpd2Oanur6+p571zG+?=
 =?us-ascii?Q?uwfccCanycH+ZozV81jSUp6jgYLwrW7M5TPMPVxGLI9Je25qxAdTK7rN9CxJ?=
 =?us-ascii?Q?sRlcYf1awLA0/zPbluh/Rlzgf+W7oy+bSIDky46RV3OnIjY6toUD4cdPQqXQ?=
 =?us-ascii?Q?oKIUCJde046FWpi4xbje6aZA2U1Ci2lciQ1SDlbADt0tep9f/eh7CZx+Egtb?=
 =?us-ascii?Q?dVfkA5i0gfzooL3XVFZeavJHPYbnM4NL3yKK58mjpNXi6mZTA1sGa2dlp8l0?=
 =?us-ascii?Q?lzdlpEglCH6R9xuHkSQ+NWDggdmIZkbaiGxolO/emttVmxh/S0SU7gJNwA2m?=
 =?us-ascii?Q?5nKqmcPZecMsX8IRpKIWoq6wIvJ4hHE9qKqlAwBSRyP3O7kisYyCGpvnsvP1?=
 =?us-ascii?Q?VEdUqUJZUEYVYfBqAtTxto149RikRenp58FxkwsU+/rpRNoXVUVPXWC5PWPo?=
 =?us-ascii?Q?G545w0v4WNq5RaWMtT/RIEu8JlTD9yQ9kuL2TBYVM+VgiBH4R3tg9i3ijYph?=
 =?us-ascii?Q?600cBgCESLldCmvkdvz3rjmt2qu3wMZ7kb8DR9w53gR9GsNEQw59JrmUN9wO?=
 =?us-ascii?Q?YfwnI6UX/iHjPle9NwLY4BPu9i4nINteVqdNvO36r31M9/qmve7PaA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84EdeMDYdr08kwR7w6KlnZVQRq3dDvYGXUXKfANFpZ/zrPuSDIL9V301EsRM?=
 =?us-ascii?Q?Jsk7lvn3PFl6PqBU982S3QjdTYMLGjTLyRXlgM4RhAtNcUAK3RK6XICWoURX?=
 =?us-ascii?Q?HXa5MIe7YOCv3MKPuxleOpni0Gd8803/bgmYTLDJh5XPBux14yH98D67wUeg?=
 =?us-ascii?Q?raCkwWIaYRKVzyuSYFYrJyqo3thapomdJeNcAwHut85t3i0nIv2A8lNNa9Jy?=
 =?us-ascii?Q?mm8CJGVowJr6aiYkngHB5i8jt5FjPQzIjOf90jAnb0ll7VyQ72Y9HCgNnzV1?=
 =?us-ascii?Q?CuwY171pyorp4Jkzd3OFaPDvjpbEYty4lIO6bAZe/kDiMLxAenqNPoRhDF3B?=
 =?us-ascii?Q?n5dxYKoBVrlc6tJ0iMS0xq+UiYu5DxkCp3uZO0oDozXXvYZBrL4wReYEVrwI?=
 =?us-ascii?Q?r0sdUCJ6MhqqYicS2HS/g1oMnooxF13jo6duOqMnQRqYh2eRhSKVpA51Z+ya?=
 =?us-ascii?Q?zClC2PqWr09BsfN0Ve8X3MlenST8g7RpdceOlhry/LIh+zln6vU7T49ujGQ6?=
 =?us-ascii?Q?yEj0i+jIssYVa5g8Cc7qViVaad3MOsw8GNNcdWNVwg6ulc3vxMWzLcOsKE2R?=
 =?us-ascii?Q?B1N4Vfd/URffXnDDnuk4hvim5rj6VEGrMCoXFALanXI+CBmIxmb83u8GPdz0?=
 =?us-ascii?Q?YXUcjDfRuvZJMiSFRPeozr6TJlrgBiQgutOBEWHBXFWogEH++ZBHC9l7I3Pu?=
 =?us-ascii?Q?IN21MnCrsbI3Owh9c12J4nZEXamJ6FXq18gkhAgEoesBWU0SrLoSEFpgldnC?=
 =?us-ascii?Q?b9xe3GeAawAosdrca/8lt5CqRdwHJ4syswvxexoi2agZKXG0OcqAapRKHJTM?=
 =?us-ascii?Q?g3h6zUaLkmzWPD40CQEdZnevFo1cBU0K+s3RJI1ZeLZppzjLJtsrK7waGY86?=
 =?us-ascii?Q?J618LVYZWmnTJiyTjzouUmlniXI2u1DQoJahGZJKEpEG6qCGqQ4An2yphPRJ?=
 =?us-ascii?Q?91t9jHllhYvsIn0cjZ4dmdyOHjjxNTutjzxpEvLn8uM9RGUGJR+DOj79ez6I?=
 =?us-ascii?Q?c95ddPR48EvrKa+LUO3WmLSH1miqO96WEvJuyfSudpXRPe5jkwsu0iXdpZD3?=
 =?us-ascii?Q?BcltECt97SgucJt1D9ZOLeN74Q4kPWxuXViA6RO6qe12g8kFKh6I5LC5SqUV?=
 =?us-ascii?Q?ccQAIah2cvF5/ABsvJsiO7gbgtGaHG9ImI0a8Bm8yPbJg/vTnx0iThV7Z9wA?=
 =?us-ascii?Q?4QOoO7cim9Gva04jEaWhm1oPrlcNggUq9qZRf2PxYK99I9L81twSEKkOr69Q?=
 =?us-ascii?Q?MgpwKStIbPbAqb3kiLq+xJXb/zM3L1GA7BskU8bq6RkBMHqzDjq7qy30UNn9?=
 =?us-ascii?Q?hTulLpe+JiLUjytra+q9sEh+LlpgDb72wHEpl2PQhas44isOhvkIbwvFrZBR?=
 =?us-ascii?Q?91SxIw4AKzBizSKqPEPzQwCbw95fVn4rC3VX/q5abCUMrceX+plVa/pv1N1e?=
 =?us-ascii?Q?GeTdKD3V1R/CAkxnZnMKNf33d/EMxv/3DQP90cH0y8pgpLB1Nvd/+/S4fuKR?=
 =?us-ascii?Q?32nVtwMK5oDhfbl5fL8MPQ242RnMopxKx0eGZTqthoBKpZIkWrQxznPrbHVV?=
 =?us-ascii?Q?XnU0ZGzX8m7zoCTT1d7rTmFTGEP6SYjP+c/sVTgS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a9465a-3693-4259-ba1c-08ddd6595993
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 08:55:40.1760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpcZL0qHA8oUSMaxM5TSUpPE+g6f2SOJ8rJqVL5w9oxk7V3/Mt3ifZKbsCGa7pGB1EXl/JGW9EBhfgksKl17qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6238
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

Replace kfree() with kvfree() for memory allocated by kvcalloc().

Compile-tested only.

Fixes: f728c17fc97a ("accel/habanalabs/gaudi2: move HMMU page tables to device memory")
Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index a38b88baadf2..5722e4128d3c 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10437,7 +10437,7 @@ static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 siz
 				(u64 *)(lin_dma_pkts_arr), DEBUGFS_WRITE64);
 	WREG32(sob_addr, 0);
 
-	kfree(lin_dma_pkts_arr);
+	kvfree(lin_dma_pkts_arr);
 
 	return rc;
 }
-- 
2.34.1

