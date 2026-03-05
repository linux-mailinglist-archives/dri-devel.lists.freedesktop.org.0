Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG6XEg7yqGnDzQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 04:01:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E420A644
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 04:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9C10E0BC;
	Thu,  5 Mar 2026 03:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Tu0xOb9b";
	dkim=pass (2048-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="dthB017O";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="YY3q5KCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1062 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 03:01:29 UTC
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CC210E0BC;
 Thu,  5 Mar 2026 03:01:29 +0000 (UTC)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
 by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6250ikGR2783580; Wed, 4 Mar 2026 18:43:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 cc:content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 pfptdkimsnps; bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=; b=
 Tu0xOb9bjwYiWIVoROJ3j0xiG91ThrpouTVxK7Yz+4KDZIMbWX5dNkgCHoul4Mbe
 K/jtcUCH15HLfxDXGsShkzh+PdDss6VZaKTcwNPOZNrHpsDxk0cEDhEpngLjbgAQ
 earkECSpXfSHAMdNwUj5Mi34qpHByhz1tlJFL2GAX9On5OT+zjyjnLd03EGuOwk7
 9MWG5W7QqEXWdbGYiTq9MBn8oY3nEAD/y2JnTugr7RXOdM/1AjC/6rnYmGeSzO0s
 9JshcNfFrrXlIKrYShcr2Z0M9qPtxsb2zBS45IWnL2dL1GDyvrEl/AK2SV0w7azg
 r+nEn09tLQvOF/3+Xs9pxA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cptastd1g-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2026 18:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1772678609; bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dthB017OZYfsqs8htB0+dMrzDTa9UeDBy9fi/yjCX6upsvBY2sbP5y/I5bQrC4rb+
 JLCHkMouHdnLYAfYhhdUhLBFiJogLMqrCTu1vcGB9l9XX5cbVIhOcg6kbRiEFcHvgf
 kIOgoZzGeVtBFwadnwGH4a5rt+mnNGl94XoZLJosOT3gClKcUYJX55jhaTAK/QF+Fn
 3obgVEWWiSbf/H5sNl6H3UiziiD4I74aj8Ycjb6WzLQI2KAZed/4mDjtguBwomAa6C
 8YrpAtE3uGUzvDY1zUtQZP1NJgq7yumCwDM7avHEANoMTzLEmv57h2jlGhBxL9Pj9h
 gru2ZjlZfHvJw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A55D340359;
 Thu,  5 Mar 2026 02:43:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 02423A006D;
 Thu,  5 Mar 2026 02:43:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=YY3q5KCg; 
 dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com
 (mail-co1pr08cu00105.outbound.protection.outlook.com [40.93.10.101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3D9BB402D6;
 Thu,  5 Mar 2026 02:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUjDC8Fg+KGqaMvjhLcNOREnwV77P3VjHu4WrLTLThUgpeVWhBUPP+7hIlWvfZANX+ccLBSOEfKA4JIrGjzhj0hWAVfmCMeRhXrEzzVXtZlBF8+4Cn8w8iWNKMyWK41Z99oV5KDBPo9GekLFQDEqrY0QCtEqQfc8OlUx0LnjpMVKi7oWdFRekAC1hOMXS4bxfwg8NV5SURTAVW7r2XHSuw6iKdQBhqy7CEFF5O510DH5DcgLHz5JnutrKcjhItqssWgwS/OTQuc46aY0CUVsa0I9BAnF1clc4rPvL24JEQ4mgohcnfDvaFMy0fPVlP+oguX5wShskMarV9aS0EB3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=;
 b=FylS8K3ygAkTh2pXWOp512qFTVMRp2TwmE/vT0jqmwN/nhYleoKa90owCLGGNaePxwD+JJU7Y0ESoMAThHCt8R+RfljIv3BtP6ksyS1wmHLl4pcoJ+RsrmmwPWSvSrbNn6CNujjGRNSQRHjd04aOqM7L6Q3KXDKer4K31691EjQ2QxMWH6/8SnJC+MwB7v9aR7v4EJOiThNiTKOECCbETlHWePs2pCEQTHTDx5VSJizmISaU52VnuyK26dPIZ9n7XodItGQUFF7K+f0SX6fCRtUlDSal11eWa4PwYuTaHvNd8gde5UFg2EwoF6I49xgvzAyTSKgNV/dHEcJ8rin63A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnYpNfR6rBYkGe6uv1E+zKHyvm2Itf2M0DoS9DwyN/8=;
 b=YY3q5KCgeNjnAaUP/WHA6q0UXGbzSlrRUSOxxf0qYESjtDjaMEjvTp1ihkRubrCxlAHPyDpl8jlhyeY3KdqQxAAEVniojQhBBl0GS5Z33AK4jgTO9Ku9Y+j4gHRBoRdYgItUbs232/51V3ywJrDtGG2+nr9qEdMA4P1/NGsTfRA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 02:43:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 02:43:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 Peter Chen <peter.chen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH phy-next 03/22] usb: add missing headers transitively
 included by <linux/phy/phy.h>
Thread-Topic: [PATCH phy-next 03/22] usb: add missing headers transitively
 included by <linux/phy/phy.h>
Thread-Index: AQHcrAC8TPH5bRx6oUuwkkIpnGArx7WfO6CA
Date: Thu, 5 Mar 2026 02:43:19 +0000
Message-ID: <20260305024315.ipn2gvbgovy7lfea@synopsys.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-4-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-4-vladimir.oltean@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7028:EE_
x-ms-office365-filtering-correlation-id: 0a7651e1-499e-45fa-8aad-08de7a60f5f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: w0lI+YqeEoJUvo2nz2G/4kSFE2LY9t7meUFWmNK0E40/YoKTDsyBhGay15bYjID2GijFnUVoWEetO1zLb22L6s5lHh+Ulb/Gy1d+pCnloN7UbYjOESEQFi2RFG4mOA5qp2md0/yZvi7mKuCq4gqsUcIfJvamjv+C/adGV5DgTTJ5fL/8hTkSLwM5d4a3wG1f/0UwGR+MVeZk444sjYOloWShAKkg47rlAuQqBwOTMpqltM4nE7WkkWK5Owm1xJ1z4QeLf1tGjmMnnntSCO2lBy/C6S5tQQqq4qSm2mVLtSJ9QfdpseFciacZpB8GuvoEAbS7+JiL5KXaafXJdi0E1K+9Vrx2AflsvTMPnvymRi1HlI8eWuWtxMxmgUgyFlQc9UrjxT/veGlgMf6uNmk8NpszbV3ZoelADT1VJwT3Dh4Wkqp6hKbYvBNOSxnuOu2u2eg2RGS1WCOYsNtkZoUUuqwVf8ZnnpDlLynfvIrsmxWfapCwm8g6hOdu3DtvTSfBpZ+ak8yx5O9V0S/EouLBRoWD0HCo9k4mJpr7Grc4IqWDvxrZCc0kAqW7tdaBucWijfeaxs7UXjAcFXPVjtSrU1nX7MB4hMygeVcX3loJLFR8kQz2kYmv5kdfMgtcMVBKxw/ZvbOOQxA6xGUcHdKXUjyBpqodpfobus4BGwItdrEhlacWjOhbR92lE2fbQ/OfZb8+R5AlVqqYIUMJyyPWBP54seK4lnTDLlzSl5FQr4ERyqdKGHFdGDS1QklrBbmAzwTF8zP+qTLVcg8WxXU9/jxD2t8s49zDNrx9QuG0vng=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFJkRDY0MUNGU0xiekxDUzRzbTk4WUVQaGplbEtsWmwxdVRSZkw3OXp2Z0ps?=
 =?utf-8?B?eUc2UG1uMWxGTmxwRVU5QkJxdnlPNXJ3S2dKMDZwdWhZNmh5SWRtWHRyNEpW?=
 =?utf-8?B?NFBOa0hoeXU5SDlaSDkvTFB4eElqYmJaclovRDNIRi9Ieko1ZTZjejlBVmVw?=
 =?utf-8?B?K0tvU3lSU3FoY0RaUUE1SUF5T3d1UmN6SDBDd2hBb1R2RVNhWk1mbzFyZzB5?=
 =?utf-8?B?TThEcDBmTmVrTVI4UGJXd2lHbGkyRmY1SEtNNjB6SXNGekZKRm1oNU1LazUr?=
 =?utf-8?B?b3pSN1Jnc2luM2dJOCtnN2ZWOTdyT2p3TWdMTlY4K2FxWnVhYnZkSVJNcnRu?=
 =?utf-8?B?YUNKQXQ4UWc5K3dHY0JpUWF3L21jMVpvVU95N044d3BGc1lwZWlOVzFqaDRs?=
 =?utf-8?B?aTJUZmdFVEFQWXh3bzZSZDYvZzZ3MVo4cHFYUnp1TTV4QXQ1WjRaYlA5Nllv?=
 =?utf-8?B?bExMcW1iZzh0OEkrRGVVdndsNlF1b2NuT3NOKzltQ3k2Tmc3OGpPUDJnUHg0?=
 =?utf-8?B?SFNGYmllRHdsNWhhSlRNc1ZTR2wvM0tvMDQ0cUtob3lLRHJUUFhLWGFPVnlw?=
 =?utf-8?B?YjlIWUQyWmdnKzcxY1NDZ2ltdDc1WlNmQmlUWVJnMHo4VjBYQ0VxSjFFLzgz?=
 =?utf-8?B?VCs1YjZLa3Q0Y2lmWHpQRmhOWU0xbExuYXBLdEtqdFVsbGxqLzd3MjV4UU1T?=
 =?utf-8?B?RFYyUUVqRElkbiszU3I3ZmdIUW9Cd3Y2ZkV3Nlk1anhJNUhJR21BUkZVNDYy?=
 =?utf-8?B?RlR3dzB2cTVnZUV5V24xYWFJOTc2ZEo1QXFBc0JlamVLWU9BZGtpUHhKMlJ1?=
 =?utf-8?B?QlRNY1JCTHBEeWNLNG5mTzFHZ3RNUFI0N0RHVVkwem0rUVBmSFhFVFpURldV?=
 =?utf-8?B?UnpNZHgycnArQkk4WWFxKzg5T3JrUmtzUURnaEFzVEFYVkozYmlHRlg4SjZO?=
 =?utf-8?B?ckJSaHZmWThRVW5sQXp1enp6cjhzd0N5alFvVGF6aVdPQ1JzSjJyc1ZGeGdG?=
 =?utf-8?B?NTVTMzNJMVY1TisyMUNKVU5yWG9Bdmh0NHhhMFpLWnovNGJQWG91QzJJbEZr?=
 =?utf-8?B?dEx5QVpPSS96Ty9keFJwNWloM3dnMUFHQzc3Ym1CR2xLbTQ3eHc4VHdRNmsv?=
 =?utf-8?B?eGRybExmZ2NqMTNpaXFzaGJkckloYjVhNVEwZ2hqVjcxZEkzRGp2UkdweUs5?=
 =?utf-8?B?L25DUUtXRHViS3liZkxPQXdqditzb1pkeDkzVjMwbWMyNjJIcWMzdVg2c2RX?=
 =?utf-8?B?NnU3Z0xwSFErZmRRTVJtRENKd21lK3BURmphR05iQVpEUHBHMzlvNzdZbmNL?=
 =?utf-8?B?dmJiNmxFdHFySXg5RXF6Mmhkb3NkUTFSNDdib0F0QXF0S05pcGJHY0ZyZlVy?=
 =?utf-8?B?dmpoa0NFeEdMeWdWemZqUDRGNnVVSHM2VTlnMjBnOWtkTlVhRHpPYUczVkJT?=
 =?utf-8?B?OXhYSDlQUXZydU85MzZGUUJPZk1URSt1aG52dThQaVhrZzRhR09BQ3RjYjVv?=
 =?utf-8?B?YlF0VmJWdmg0anYxU25jNEpQWCthbzIyYzJYQlYrVENxVmQyWkdmY2ZORDRx?=
 =?utf-8?B?aTA5T3A2S3NwN0tydmMxLzUzS2xwY0ZlVm9MdzJEQXBMc3hiWmdBcjloRXpz?=
 =?utf-8?B?d3NySXVTbWRhdnZaMFpvWENXRHlUL3hmM0xpNlJwU1I0UXovWTNiWUlkSnNx?=
 =?utf-8?B?S3U5ZlhzR2Viem1ZY2JMM2U5SFFKZGR4RFZxWGhRM3BQTzVWTEVVa3BJbjJn?=
 =?utf-8?B?dmg1Y2FyOEJPM2VNTHJ2bDhPZHZaeFFMQWo2OThqQkNPRVRUSXNzSzM0d01m?=
 =?utf-8?B?bEJ6WThQbU85VVNUeC9UdWducXVTVXJRb0hqN1RoRTA0RkRtNWJhWWhqcHVn?=
 =?utf-8?B?bjRwOElNSEV4L1dLK1k2TGZoa1U1NGRDc2hibzVXNEI3SUp0aE5yUStqZmJM?=
 =?utf-8?B?Q290WmVhZmw0RzVZbVh2cTdTTzNJS0thTzNKaUYwa3dLRy9DRzcyT1R4MEUx?=
 =?utf-8?B?bVh1K0NXUHczVXpkZlJuN0RRRXpKYWFjZWVOL2NOa1ZiN3hTalFWOGxBaUts?=
 =?utf-8?B?NjRZUXFGZVF0MjZYckpDODFyb1hxQXpOYVhOd1dOVnZneVVvU2NlTnh1QXlQ?=
 =?utf-8?B?cENPU2MzL24raUVBWHFhSi9ieEt5RWVkQWNndWhBSEtaNERrTWNwVGhjSS9t?=
 =?utf-8?B?OXFHdFVpeUx6ZTB0d1hxbm52anhOdzRyQjBodFMzZ2xTMFB4ZCtXS0VZeW0v?=
 =?utf-8?B?QnVGbXBpajdwaGF0MTk5QVN0WGdNUVpUbUFvS293WUN3d1NDTDVINTZvVjlM?=
 =?utf-8?B?M0xqUDhLNStJVm5vN2cvUHdKazJ0dkl0ZWs2LzhhUjdZdFBramRUZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF2352D6A20F94D90242F8740EB3F7F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: STeBkx9Y1j0MWrKp5DWmzQKuckIMEvZVvuRN40JZqOyurjsyrGsVTxrKUHyajKRn+d/icDKvGBmTTpAZfcTu7LYErLJ1/uMJF+ruz5PzszcLyQi4hFw5pU+ujlREjb6a88Zt3FARxyiFdy94tcvmk9ibJrXuDrosUjVYrWHY3ClYmDcS8yknt4K4hviC+lZM809FERK2QohN7HNDdzeEWvXh7NZPlqXeyjwalfS6R1/Qbg77+Q7VLsuqyc8ohLf3dk2fZOCRzM//gi9XwSAf6VA7uNfnun5TXpW3wf3ImyJ1wAAl6Hr7kvbjIkzq57xPnIBExQFALVY7/2B0M0EEmw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0WwY06hpvEnw/ZTrp8doUgnBNgy4/JLnkwXQid2ts2rMOkE4NmQgCeNqukt8NaBuOa+2s99bmq9a+CKxaXt9DxvVVXARodHPPHkKuzKH9vCb8UTnC9tLcdibUCrdMWd1YM6rof/qpYq3shzpo9iNLVKPnbzunzuIlsZs8k5LUHQTuac4GQeqUXMq7Pef7ajDWgZyECBEwTRAMZECcePJd3T7wNK+LilvN6f5wcI5T7NECjfxmaNJI7Fhiieh5aB+C/VCUkt2/nbse+0+Yt5+jpsTp55E9eEQeBIx+UtlMGz43nhsRbcGqo/bvNuDNTTTE22nn1U6hCeb1gXVyyQ+ye3PkSeHrxj7WGKfY/RQFPGmmZSw3lrMHpnfheTDhiLAKx45vFWme0oAEKoN6upfl4d9JljrPUnZxp206omInXPdh5zB3nWOfEUeuKTosA6UViDU3SfE+sy0U+GV+GyHlDm5Xx1OsKLCv2UL4/T62lNUnyo56I2g74HaHZvvP93fBH3RxJJ+mMlxow8u1h5Qw/o171LuWkHQ15q/xn/wuaO3vPLqxC56pRL5cUtUF/QvaiUouBCKkWTYuLvchqiPO1NQkhPjSFKKkw78z1lbps/KtLnSjYjBLTvCcUJsveGY3Kh7HmJp49ZPJsZgeBmyqg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7651e1-499e-45fa-8aad-08de7a60f5f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 02:43:19.4787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E8vxE6vyUkEPO7Y7Djfk80lBF7seO80UK/xP4jmil7I/xEG9f8Mxb9dxMxbjAtGTibLBKttAsYXnse7e37Ni/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028
X-Proofpoint-GUID: I8_piAzATCRcGyWl9AFd_njvTanz_ZSW
X-Proofpoint-ORIG-GUID: I8_piAzATCRcGyWl9AFd_njvTanz_ZSW
X-Authority-Analysis: v=2.4 cv=WrEm8Nfv c=1 sm=1 tr=0 ts=69a8edd2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8
 a=jIQo8A4GAAAA:8 a=4jXbIR6WmcaQWBQbZNIA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAyMCBTYWx0ZWRfX5CxZ+HnnjQR6
 unQrpLVHFt7x3ub1wB1qMdtRoiNrxLxRBWvF12djGAM6oP0DhVnT8oSNgFBmpDti0HyHwZXx0zv
 6sm/r4+ImFkDcR74xGzIvzfbUsBPauzpKjweTI4YdIbHmySLV48ge+fd4tQxcjN4DIfam3U9bJo
 VvCquCGXg4iBk/5fFWlvsorpC52e+audszu5hgqTDXqVrPLcyMTcJdp8V8XZNOjsUSUW5/AWIFI
 Ps61E+6RU4WYiG6qdm/0cEt4PERAiOZO8rlk0OOLzJB953lgwyPwzCdsaRDua055TBk/eyU6uG4
 LmZUcHUdukm9rZbFuCwUrcEfcsgRUlO4tRg6hf6NAtbfxu5I6zKsZTJkQSZ0xATwDFl5oD2zTf7
 F4aucg7eUPGJQSeBLYTk7dcetutcFM6/ntY9DRUAYzDI/Ok2TxGWmqyvIlGlkoVX/iIHiMjHiTt
 iVA5kyYVn2XCDTZSqRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603050020
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
X-Rspamd-Queue-Id: 984E420A644
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,pengutronix.de:email,synopsys.com:dkim,synopsys.com:email,synopsys.com:mid,nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,linuxfoundation.org,nxp.com,pengutronix.de,gmail.com,synopsys.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

T24gV2VkLCBNYXIgMDQsIDIwMjYsIFZsYWRpbWlyIE9sdGVhbiB3cm90ZToNCj4gVGhlIGNoaXBp
ZGVhIGNpX2hkcmNfaW14IGRyaXZlciB1c2VzIHJlZ3VsYXRvciBjb25zdW1lciBBUEkgbGlrZQ0K
PiByZWd1bGF0b3JfZW5hYmxlKCkgYnV0IGRvZXMgbm90IGluY2x1ZGUgPGxpbnV4L3JlZ3VsYXRv
ci9jb25zdW1lci5oPi4NCj4gDQo+IFRoZSBjb3JlIFVTQiBIQ0QgZHJpdmVyIGNhbGxzIGludmFs
aWRhdGVfa2VybmVsX3ZtYXBfcmFuZ2UoKSBhbmQNCj4gZmx1c2hfa2VybmVsX3ZtYXBfcmFuZ2Uo
KSwgYnV0IGRvZXMgbm90IGluY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4uDQo+IA0KPiBUaGUgRFdD
MyBnYWRnZXQgZHJpdmVyIGNhbGxzOg0KPiAtIGRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCkNCj4g
LSBkZXZpY2VfcHJvcGVydHlfY291bnRfdTgoKQ0KPiAtIGRldmljZV9wcm9wZXJ0eV9yZWFkX3U4
X2FycmF5KCkNCj4gYnV0IGRvZXMgbm90IGluY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+IA0K
PiBUaGUgZHdjMy1nZW5lcmljLXBsYXQgZHJpdmVyIHVzZXMgb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCkgYnV0IGRvZXMNCj4gbm90IGluY2x1ZGUgPGxpbnV4L29mLmg+Lg0KPiANCj4gSW4gYWxs
IHRoZXNlIGNhc2VzLCB0aGUgbmVjZXNzYXJ5IGluY2x1ZGVzIHdlcmUgc3RpbGwgcHJvdmlkZWQg
c29tZWhvdywNCj4gZGlyZWN0bHkgb3IgaW5kaXJlY3RseSwgdGhyb3VnaCA8bGludXgvcGh5L3Bo
eS5oPi4gVGhlIGxhdHRlciBoZWFkZXINCj4gd2FudHMgdG8gZHJvcCB0aG9zZSBpbmNsdWRlcywg
c28gZmlsbCBpbiB0aGUgcmVxdWlyZWQgaGVhZGVycyB0byBhdm9pZA0KPiBhbnkgYnJlYWthZ2Uu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBu
eHAuY29tPg0KPiAtLS0NCj4gQ2M6IFBldGVyIENoZW4gPHBldGVyLmNoZW5Aa2VybmVsLm9yZz4N
Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
IENjOiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5o
YXVlckBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5j
b20+DQo+IENjOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19pbXguYyAgIHwgMSArDQo+ICBkcml2
ZXJzL3VzYi9jb3JlL2hjZC5jICAgICAgICAgICAgICAgfCAxICsNCj4gIGRyaXZlcnMvdXNiL2R3
YzMvZHdjMy1nZW5lcmljLXBsYXQuYyB8IDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
YyAgICAgICAgICAgIHwgMSArDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMgYi9k
cml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jDQo+IGluZGV4IDU2ZDJiYTgyNGEwYi4u
MGEyMWQ3Y2M1ZjVhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJj
X2lteC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMNCj4gQEAg
LTE3LDYgKzE3LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9waW5jdHJsL2NvbnN1bWVyLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcG1fcW9zLmg+DQo+
ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+DQo+ICANCj4gICNpbmNsdWRl
ICJjaS5oIg0KPiAgI2luY2x1ZGUgImNpX2hkcmNfaW14LmgiDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9jb3JlL2hjZC5jIGIvZHJpdmVycy91c2IvY29yZS9oY2QuYw0KPiBpbmRleCBkZWU4
NDJlYTY5MzEuLjdhMzI2MWY3MjQ2MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvY29yZS9o
Y2QuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9jb3JlL2hjZC5jDQo+IEBAIC0xMCw2ICsxMCw3IEBA
DQo+ICAgKi8NCj4gIA0KPiAgI2luY2x1ZGUgPGxpbnV4L2JjZC5oPg0KPiArI2luY2x1ZGUgPGxp
bnV4L2hpZ2htZW0uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRl
IDxsaW51eC92ZXJzaW9uLmg+DQo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gaW5kZXggZTg0Njg0NGUwMDIzLi4yZWUxYmI5
ZDcxOTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1nZW5lcmljLXBsYXQu
Yw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtZ2VuZXJpYy1wbGF0LmMNCj4gQEAgLTgs
NiArOCw3IEBADQo+ICAgKi8NCj4gIA0KPiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiArI2lu
Y2x1ZGUgPGxpbnV4L29mLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
DQo+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAu
aD4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQo+IGluZGV4IDBhNjg4OTA0Y2U4Yy4uZDA2MTcxYWY2ODcwIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmMNCj4gQEAgLTEwLDYgKzEwLDcgQEANCj4gIA0KPiAgI2luY2x1ZGUgPGxp
bnV4L2tlcm5lbC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQo+ICsjaW5jbHVkZSA8
bGludXgvcHJvcGVydHkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICAjaW5jbHVk
ZSA8bGludXgvc3BpbmxvY2suaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2Uu
aD4NCj4gLS0gDQo+IDIuNDMuMA0KPiANCg0KRm9yIGR3YzMgcmVsYXRlZCBjaGFuZ2VzOg0KDQpB
Y2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFu
a3MsDQpUaGluaA==
