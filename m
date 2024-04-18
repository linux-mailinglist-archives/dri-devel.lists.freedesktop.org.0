Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328D8A9C3B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6D5113CBD;
	Thu, 18 Apr 2024 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="YtXlq2AR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2078.outbound.protection.outlook.com [40.107.15.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE96113CBC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hezvwUiAhyP/Ck2hkFEkWzH6hco2Yq1NFA0ax5ObBlNqnU05a2bCrBF++2C+qFt0ienUezH4mGns4I/0Qs5xMtmpMBlrf1V3sBv7wfrPJHKZ3BtBln3C1hmNxy1G1QhlsrRdDhhrdWtlrB/W4b1kFimYrzbyO1cVa/WrklsBSIX2IEbDle0uuHCc5TzJ5V4qOwIKZc2gzUsCn4n8nVsLsPMOJ+U222pmhEYVdb+ng1HgduGAPyhVJT2ieiyVQKwfRffTUBUXkyQ/pJPOTXdJvYeYXdn6aa7D9BadVfrWdujQYpLmJTln8l2thFiin9pKHIUd0DzhgjOMKV49VfD1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hfEe7GTex4iKciDCCof46ndDYh/vK1lOIio5VBptI0=;
 b=SjY1Ff4S9uAX00U7vSKJg/8sEYRU+gtBr0xsLkSYrmlkASFV7c12TT9nAIsUWCgwKfKrsiHojtpJc2czMZFy6AzBxonzRH1U0+/dD4NsfS5Ma0fkxpIAF3JBfrQln4BPAZ3dGmGqBfJnCmRRRKu75e1f9IQ3nXCXUXEbquEYsVsA+5v4uqYb9kOfsgRiD7xYMn3KXHheKbwLgHH1cALbCprnCSCVJaad6t6Xck9PR+46PWLzjuVCDm5dnWeQqDWtgF64krEO03bvyGh8GmKZ6CntbIWKq+2Twf3r5qzSvXHCflbT0yO7p0P6Dlahcu6RW3Vn7ZIz6q5GmxKT+tD1XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hfEe7GTex4iKciDCCof46ndDYh/vK1lOIio5VBptI0=;
 b=YtXlq2ARyh8tKzcxoUPG8m51nbQWjDAYt79pKihB9isoxzgh4hhly1iyW3WHQoy/qc1xS/gAU5O+IgH4HhhseA5fG6HdQGvWS/MbjWPNBP92b+jk5mT76cLy+yrEeXDsJHeFuGU+Hu85s1ZG66VyffctM3YiY3qg8SH0x0/r5ws=
Received: from AS8P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::33)
 by DU0PR02MB7972.eurprd02.prod.outlook.com (2603:10a6:10:328::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Thu, 18 Apr
 2024 14:01:31 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::75) by AS8P250CA0028.outlook.office365.com
 (2603:10a6:20b:330::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.26 via Frontend
 Transport; Thu, 18 Apr 2024 14:01:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 14:01:30 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 Apr
 2024 16:01:30 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 Apr 2024 16:01:30 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2DEE317B8;
 Thu, 18 Apr 2024 16:01:30 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
 id 295C34015200; Thu, 18 Apr 2024 16:01:30 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH 0/2] Add generic panel-dsi to panel-simple
Date: Thu, 18 Apr 2024 16:01:13 +0200
Message-ID: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKknIWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwML3bT8fN20zApd09RESxPTREOTVKMkJaDqgqJUoDDYpOjY2loATp4
 SuFkAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
CC: Johan Adolfsson <johan.adolfsson@axis.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AE:EE_|DU0PR02MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: fd13cb16-b6de-4358-d704-08dc5fb00c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7AnqfXf1OF7Ca0IbXAAvSWn7r9nxeR2LzTZtFb/ebo2/dFkMMqIlNrYHzXK+E99J7mSEB9FGoAb0ABTcU9PsDeivguZIkZnr6c/qL38zrsj2xiPdj8fiG4kuRpnhRBejqUw72jApPkRV3/6+gt9mYvC8vO3jhG5f/gn10THarc7CDlEVpr/xz213FcaWzihTF9tS3TSpX2kCJ+XK+ggguJ5MPHNzd9yXTwXi4Kg3qHXHTzOlm9/rvrSyXniX27r8PeIUZTvzYm1sOHndYjfkCDOXZWvMDW4zg3wLAoKsprvNcXsiQcSTi8d5zjIGl7nL8SkMK+VB+KSVNZY8z18aHWJ+Pv+HO8i9BQFGnYEIbAZnHorufH/eQMafuGW3qwpRovZ7gqn+hfGnM42+2K/Q7CHzYEHniEtLM2cQ3zfrt2LF+WZB5HC3tDS7KDXLIVPjwy5Sdu+PkKsP1RFDGMLCk1F+SB//KPmc/YGd5V4BCMGr8ccN3SNP7C1cbjh5Fv3nfZ5JlGYfRGtLlWWTBNRblNpycSW4vgmLxljnPtWlQAX6UVyA8QlW6dD+IeG+PDETXDlUxgBI+HPW7Sbw6QIBHtkffr2AfLC50vXbQuFEYLF1j9LetVtfGXfDNYrDB7mdy83AnN33jpixHwecuZ9eleL0cuZem6V4rCTtNLQpLRkVyl2Y5pl+QhNnVrnqIWYneQhLEv32VcyMjhBFKhU6OIs11DUOc5IQCmIRUE+lvN+k9EW9uq+0rilKuTKiSNhN+Mcw5H2aYSJGlSlay/7KQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015)(7416005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:01:30.5854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd13cb16-b6de-4358-d704-08dc5fb00c60
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7972
X-Mailman-Approved-At: Thu, 18 Apr 2024 14:05:57 +0000
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

Adds a generic panel-dsi panel similar to panel-dpi to panel-simple.
Allows override of timings, flags and lanes using devicetree.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
Johan Adolfsson (2):
      drm/panel: panel-simple: Add generic panel-dsi driver
      dt-bindings: panel-simple-dsi: Add generic panel-dsi

 .../bindings/display/panel/panel-simple-dsi.yaml   |  2 +
 drivers/gpu/drm/panel/panel-simple.c               | 76 +++++++++++++++++++++-
 2 files changed, 75 insertions(+), 3 deletions(-)
---
base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
change-id: 20240308-foo-fix-5ea945a14e2b

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>

