Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08903EBC9D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 21:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4926E8C9;
	Fri, 13 Aug 2021 19:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80072.outbound.protection.outlook.com [40.107.8.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5530D6E5D1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 12:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PF8QxP7Fjd7LukTAxZGO7Utc1GdcdGlhOg0inxhFNU0mm67sV5u3gsDKmep/iWaXmcVKHPXnyDFR2Yjhxv0IagXx2CQrSd+8j1QS67fNCZGdoLVRrh7ckjTmhPsYo0kWsrcJfBEWIdHq/31kbWqqBNOf8cYbDiHn/UvbjrSo4i0ynbM8Dgp6A4rprjMueoLcUgHUKrT4sdYzTrVehdz8Kk3wvOK3XEK3pauciKI2rHOdTRY0YvdsIzaSMg+HkK//0GU74sAEizg62qWBEL1YjPbpBbVZFcOCOPLn0n8FWQp49qevGSJwkjRcuVxurHC7bToPuMGaVb4CrmGiKWaIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7AeRdqPQhOfwnaVxEkGMi/wub7V1LqOetyQDBwjCbo=;
 b=kuyeHcZmU2VjvMR8McGtAojYe0OTJaxQidzV8r8hVUIwA3BRrA8HvsHhM4+MOG5gZzC15WK4ufwkoPB6yifJdBPTbVzTzSL4RTpLUWKfGK4OT2ZEUxP4nZIkKJXEFaQQXau+iKu1zq/LxuoHBfMjp3Csd7PGvpjTsdhFWcveNDJE/7IZ1APQRQ5i+7IX5erlDRHG/4G+ir3OlmPNp7Rlbd0wsgIoHwATnYf+j5FbT+zEpx+eiSzSjh/vNZ4+NkjTwUX71RYuEPQPagmw6suIPZUwTSQhE9M9zzMzfsaAMPwNODm41GC1an8yOroPRvCigcBhTPYdM75mOTGq9RoRgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kococonnector.com; dmarc=pass action=none
 header.from=kococonnector.com; dkim=pass header.d=kococonnector.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7AeRdqPQhOfwnaVxEkGMi/wub7V1LqOetyQDBwjCbo=;
 b=IwbzFkRQpR/oQbHY8MKVin5tyET94ER1OOV7/1++kHp+8xgQn9P6WmGEXCCZBJeBBo7aDlXaYKfxVNgO0oeIVRzK//tTJtmQCNpIPP0F6gnOjPx+lTMbJznPgsAD7kXNVv8RlcUnNcN18grTZ1hGkzTrb0PmHFCxHgKMkOlazY8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=kococonnector.com;
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com (2603:10a6:20b:281::9)
 by AM9PR09MB4962.eurprd09.prod.outlook.com (2603:10a6:20b:30c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Fri, 13 Aug
 2021 12:59:44 +0000
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1]) by AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::35c9:eaa2:9d67:9ec1%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 12:59:44 +0000
From: Oliver Graute <oliver.graute@kococonnector.com>
To: gregkh@linuxfoundation.org
Cc: oliver.graute@gmail.com, Oliver Graute <oliver.graute@kococonnector.com>,
 Carlis <zhangxuezhi1@yulong.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] staging: fbtft: fb_st7789v: reset display before
 initialization
Date: Fri, 13 Aug 2021 14:59:27 +0200
Message-Id: <20210813125928.3734-1-oliver.graute@kococonnector.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0076.eurprd07.prod.outlook.com
 (2603:10a6:207:4::34) To AM9PR09MB4884.eurprd09.prod.outlook.com
 (2603:10a6:20b:281::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2.207.138.2) by
 AM3PR07CA0076.eurprd07.prod.outlook.com (2603:10a6:207:4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.8 via Frontend Transport; Fri, 13 Aug 2021 12:59:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d07eb077-18b6-42ef-e933-08d95e5a388f
X-MS-TrafficTypeDiagnostic: AM9PR09MB4962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM9PR09MB4962AC2DBFE839538E4FDB08EBFA9@AM9PR09MB4962.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p+Aq4fVTLSw2+Tk4wjJF7IYh4oAWVlvlk5d+T/QQ+VLmoFJCQEZt5jaYtO3Tigig0+msJ+yR3zKv6vK9fllIOfHitqyp/GeFigHc9aUYYjtwVYeMPHBNU6qQ4u33qM88JroSw2jODfLEtsa8T+NVbYHUO1ec1Cv//OmLxLmDZepDD49xuX4Jr96Uxn2FiMSYihSFDgjOSkW1C/KIlfEMU6cn9KH9lFWscafq0wRrOGa4D5iWSjBGyi3XVa5kv8S72akcwhhik01dwMmkIruFMjCqt34AZGUJwXY40yrXb450lMZwWoRhWlg3kC9YpVSCWLR3To1/m0Yz2C9NNhxSBMsnkDo/20I9DNOPsRIc+Tmmw+BvRnOG9I01qZRsxb9nkYChBAAKcqHQDR2TVpbWe8u2N0ZjefS1L3UmI0ycXf/oLD8W8w+r231Bv2zD+E58grW9TXWEdVkuOgIUmq/46rDXIzzL9R3UWgPZSlqGPWJnWBuPUYPF1BiLSnydBGzC/QegWzaet46vDQr/rj7F+tJwHh8lfdawo7BdwJ6qLnzDz5qvLbh/26BztpEmCXwLd/9L0jub7F6c5kXq3gRE7Eyp1ARYIt269V3m54F3IRXkOd+NEkIeoATOzjPZyBaoKySU5G4uUDceIMD2TeGIcUpifJ/bOfHpd8tWugiPfeJjuhZ1Vnf8XDPZDWaV8xYs+RGdF0rH2zKbGIRLcSwJxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR09MB4884.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(366004)(39830400003)(136003)(6486002)(52116002)(4326008)(86362001)(66556008)(66476007)(8936002)(478600001)(4744005)(6666004)(66946007)(36756003)(2906002)(956004)(8676002)(44832011)(26005)(1076003)(38350700002)(2616005)(38100700002)(316002)(6916009)(186003)(5660300002)(6496006)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A5rKLG2XmV+NL8u8+KACicKB+XZquxqgVTMan18s6H4QjZqoV5pRrEKPgFhh?=
 =?us-ascii?Q?HAG2T4/mkRCxvaiyBtMm/GrKfSCRqTacidrRQ22OZEJFx+n+JpPR/3FKNJzj?=
 =?us-ascii?Q?hR+U2VJ2xskUsLjNYbS2/mFPaQnf266l0wJIL7o6oot9M4ZJsuDG1c1+WDNo?=
 =?us-ascii?Q?5nnheWbhLRvHROUZndfSuLoJgr9DiJ+Ot02Vuna8HLAcFFREkE6F2IgHePon?=
 =?us-ascii?Q?/kNMm9PpgjJfzjcy1k9+43S4G/ESqUj2ROzVlg6w1T1xUAvv81X5DazNeLNW?=
 =?us-ascii?Q?mQT5Mun672KeE0i6MgPFqbJGD7UStKbJRsnxqaU3QTxjKS7gJ851joFdiqy1?=
 =?us-ascii?Q?M2UoOMPcLIgtQuaPOsEJqzRpj+iv3eV4qm2kQgj1/FoKJWOoPeK88w8W8sfW?=
 =?us-ascii?Q?09IyHJFFNB4effyTEf2yfM48zLPJQ6a2hRiDIy4Kt3seHu09ZqOHVpzSY9iG?=
 =?us-ascii?Q?nXIB92PUZ+YfTisGtik3BR7hdc0Fq0dLsMkdQ/RdmNzsRH4kwpWRi14z+Tyj?=
 =?us-ascii?Q?atQrYnGEGSknj9AlNqkpZS0yjJMKBlBTZS5DeB8VorsAdZITRhO3gMOwyXcA?=
 =?us-ascii?Q?jx+sAnPAKVmIoAtrEm4JGztkUpEP6WOyufPopATRm6l37mF8vNuxpWwSQ+px?=
 =?us-ascii?Q?BkL9/7PCJMxUCH1jSDd1VJMpx+ATc14hrxPye81HL/QhOq2rTG8OeBA4KsXQ?=
 =?us-ascii?Q?j6yjiww6hq9n9db8LLqU8y127FX6cdoRmh7zhErwky364HIjhejdPBBk4A7+?=
 =?us-ascii?Q?H2BBhPSWGh3brgzeGz+sEjw4ZF0BdGvSzR1/VY4uxSNgezorhYqYnkQ1WXXG?=
 =?us-ascii?Q?vgxAwympXcXgZ+aXF1YD2lE6xzklz4m5FX3B87zeBhekxr0PMD4+9r6teekv?=
 =?us-ascii?Q?E3DtvXctEVuincqBMcFDgK2I4UvjR0NWaUK5L1g7lO+JH2t5hfxIvqU1NAEd?=
 =?us-ascii?Q?KGr2LjZcrHgjaSwqk3KQ102TdE2xYNFGZWTiIX4DRTWkOx0g8oiHIoHY10dE?=
 =?us-ascii?Q?04v9xuGMrC7N+pt3jOadjdSGX3xmccV3aXFrPFgQSLCRe1c2quzrLHuwgDZp?=
 =?us-ascii?Q?pZRYwrjg0EkRCCbzC7BZxsEC28MwOfCvdy8M6k///k3o+jlnHe9EJ8cAHJwW?=
 =?us-ascii?Q?7F5sU08/t6TiLxATYgYXgVfbl/S84AGUWG7+JGPeYMJbEfADCGiU5jzN6vwk?=
 =?us-ascii?Q?AUEsn0+JffW1xo4Y55vkcs/BuU2J5DlfKRbxcZHQV3eMbW5wB23F1A8lG+uN?=
 =?us-ascii?Q?78fgcVZUoVB/+igVQlOGXqpTvYeLK8Z1gB56M3vIRcefZuTYMyAM5Yoge/64?=
 =?us-ascii?Q?bLSmscLXeSzRMJt3G8Iab9dh?=
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d07eb077-18b6-42ef-e933-08d95e5a388f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4884.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 12:59:43.9634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSFIT3sAj6dif6nqesBEBRDudDJ6A7JaCXxygXZd05C51g7uExAk+0XdiUfHop5r44e8AEQPi/pF56E6VBfqlKdkpFkaV+1/V2AkakorVGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4962
X-Mailman-Approved-At: Fri, 13 Aug 2021 19:36:13 +0000
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

In rare cases the display is flipped or mirrored. This was observed more
often in a low temperature environment. A clean reset on init_display()
should help to get registers in a sane state.

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3a280cc1892c..0a2dbed9ffc7 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -82,6 +82,8 @@ enum st7789v_command {
 {
 	int rc;

+	par->fbtftops.reset(par);
+
 	rc = init_tearing_effect_line(par);
 	if (rc)
 		return rc;
-- 
2.17.1

