Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571B1C0EB3
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AAF46EC2A;
	Fri,  1 May 2020 07:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50070.outbound.protection.outlook.com [40.107.5.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3A56E912;
 Thu, 30 Apr 2020 14:23:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZi3X8oE5ztZI3lSJ39AcGlTfG9ZF93w1m393Adp3yGQDJVvtKMa9n+Y6bjavvWI0iPFhareXY5Qv8xYA+9leSgDNLjFWVF7SHtqJqVw1rVYRNiZfAMn9NM3qyU7AXENp0U7P0qjwQiKIU2Akd+IBWg401AjoD3xokPDvze2eAWcKjkpt548qE83KXzQp16Hm8h6qy17/6U5h15LULTgOhr19EpschHfxrhf/7yxjI043bXr1b4Gp87Sgwgg8KkE/M8GqHnu4wrFOQOqo/lLkYVKdLL+v7PR4d+sTogBl10HZSnGAU48iji64X+VxoxODe/4lRwQD/ABLXR/RSGk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgwA8dy0B0OjevUiIbvjBH0k35sbLfhD4qGkgFpt5ak=;
 b=GZZsiDtd84zVU3DzxnZvkCYM1AYdA+zNm6jpM6i6CHOQNz63cpHBNGOTL9fOlKLlw5JARnsOhZ2s6KJYwXuK5yHTG1vOKfHX4tNON42zLTvUsRQIlGAL0ilCdSoIhVCKvtiWhs1IGeR/et/w+3IMUxJNqlRR9oVRDqc7ztBxYVn8yC6CVSlElSDic6D5NkL+a+Y0yIeco9j+qhB4UJNrFMNeK9C2TQxk43dN2xjHjmhQNVHGLV+PFdy+iFyrtfCoBN/c0u/4Kcwi8tLqoSHWhOXc/k6DtOzgu2TT2zCSyBvIzP19nPEYumdqjDpybKtpI8P6fLCAOn6m17AuyCMi8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgwA8dy0B0OjevUiIbvjBH0k35sbLfhD4qGkgFpt5ak=;
 b=mqwhmqLBlsMTZsFF1nKTWRPD7mjgHGDMBrZpQzwsgJMjvAm3fGNCfYW2M6CKgOG6g/9Q2N+9d3rdP8UolM9AC/Iu7n8mViydXLciSn5y0vs1mhCIjMMs5xRxYWunZD9ehsZKuNeQ5AieI0NE5DcV+3TCAefT5j/gS4zHbOYlqNE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0401MB2464.eurprd04.prod.outlook.com
 (2603:10a6:800:56::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 14:23:50 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9858:e485:aaa6:ecc8]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::9858:e485:aaa6:ecc8%3]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 14:23:49 +0000
Subject: Re: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe time
 on i.MX8MM
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 Adam Ford <aford173@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Leonard Crestez
 <leonard.crestez@nxp.com>, Li Jun <jun.li@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-2-frieder.schrempf@kontron.de>
From: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <5c4c994b-8868-f68c-cd0d-7f7a2530f697@nxp.com>
Date: Thu, 30 Apr 2020 17:23:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200430124602.14463-2-frieder.schrempf@kontron.de>
Content-Language: en-US
X-ClientProxiedBy: AM5PR0202CA0018.eurprd02.prod.outlook.com
 (2603:10a6:203:69::28) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.100] (188.25.27.134) by
 AM5PR0202CA0018.eurprd02.prod.outlook.com (2603:10a6:203:69::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 14:23:47 +0000
X-Originating-IP: [188.25.27.134]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8eb5b4ce-0207-4f8f-54d6-08d7ed1219b1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2464:|VI1PR0401MB2464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB246487BFC48985FA3C0D099FF9AA0@VI1PR0401MB2464.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 0389EDA07F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(8676002)(44832011)(2616005)(31686004)(956004)(186003)(16526019)(66946007)(8936002)(478600001)(26005)(2906002)(31696002)(86362001)(66556008)(66476007)(5660300002)(4744005)(36756003)(316002)(54906003)(4326008)(16576012)(110136005)(53546011)(6636002)(6486002)(52116002)(7416002)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0IGT4uou9PK0QOiAw2oz/QgmCAU2fAxJtN4K0MV3nPTCB4thUoaxjd+9/nWT7jkdFMdBZzQaKcOLvvgEiTl/OrNcKgqfCdltR8OZsC1LfNGeXcBusj4T+yQbx8bJW/FjfMegB6IwSFgjkKH6nQTIW/clKhkWBnDXN3DurNSGj/3aMkk1oUCQMFWLQcCoQWu39vX07zf1I7SF/BCo1heCUwPN3p5z59PchWWgG7uxdiPI138G1J7KnNw1yfRr7I+dzQGE/Hn/qp1dgMa0d9IOXANIx5wS6Uas+7YglCHrIZnMHZ0chBpGJRKgNX48uqpHVOXUcafjJP30d35gKEaARU9AWx1/K7VBlRWRN0I6eDyk/2qaq0YCevc9IljV8lVi4nckLVf43r86hRya7N6Nhwoa86jyAeGXed+cPvqmYP3kQB/2KAKuEJHWvohvE0A2HhrIaBymWitPDNO9wRKp0MtuMHo6PRTZF9arE9nl+14=
X-MS-Exchange-AntiSpam-MessageData: BnKFYfgKUpunK32IGgixQpiK+0unEmaS66p8IL/krJwB2URlml3A8p5x6EEPULqRLUifaXQFjF7xFUtNi4jVFDSiOKQ8NZcDsUeHV3AnSAKnqjiX4UFXK3cTnZvjWy3VyrZ9yuzrgpx/ed6lnGi5tVuQXx4H+MT50oPpSuaPw9092OWNTRXKYiu0M5DmrgXRCsu1y7m5zPbRd/swuglr9ofh3IHsPujLKq6oi9ykO8CdvB6WH62AqW0+xMEmLSlO7QZlapnhuD6KHAX3vrrlS/2ibOhHyu1UbD63wFLTXlPyfJQX/Tf2AkLyHdzdXRBuTBWHSMRy9J5osQiRtvlzcIf6fbHV626gt4EhAoVXW+IHNRInHZvVhXO0YCjwDOHAP5471qR2NdJDYf51GCBAMKwXQc5lPCi6QFDVt/9XpjsPsLl//fYsyWJ3Jbb8/AG2K85z11rACT7Z0Fu2iHymM/HHJsQ8yUSMaXj1IfbzRTjiGW3Dyg+8Ic1LIOHz7sgabYidxQd5N1yREu1P44D+qhtRsbuaPtlGYgBxjAwEgDWKxPg+pRbBSNPnc5u/lBSZfh/MpcKHEsbugr7Fc1/hQIN1pXAGuluIRIiLvY+sUGc93oHfTSkzonyrgbIQGv9GPsBcBjnqv1myOeeG1pedqcnzOfNlfYQQ/MJcUMLn9PhbgvKGUiv2ARkRyijYy5sUeulwrbgOhRGtGrBMZ3w8OUAuqQ1XRyyAOBTTh3ENSZgwJS/6q/Y0UHsXymvCUHrlk9svYUzl/Q0IP0lI+DLxbb9mL4eG5RIFdl0pXO1SO/Y=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb5b4ce-0207-4f8f-54d6-08d7ed1219b1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 14:23:49.6818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcWHd6PYy0VmYZCsfnZdzw21Q8K+2FLcyTr6rqqjkrEhPheo/x2R/pG7ITSzNow8LVS7/kay0B4bbBHMjN3QKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2464
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/30/20 3:46 PM, Schrempf Frieder wrote:
>   
> +	/*
> +	 * On i.MX8MM there is an interrupt getting triggered immediately
> +	 * after requesting the IRQ, which leads to a stall as the handler
> +	 * accesses the GPU registers whithout the clock being enabled.
> +	 * Enabling the clocks briefly seems to clear the IRQ state, so we do
> +	 * this here before requesting the IRQ.
> +	 */
> +	err = etnaviv_gpu_clk_enable(gpu);
> +	if (err)
> +		return err;
> +
> +	err = etnaviv_gpu_clk_disable(gpu);
> +	if (err)
> +		return err;
> +
> +	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> +			       dev_name(gpu->dev), gpu);
> +	if (err) {
> +		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
> +		return err;
> +	}

Shouldn't you disable the clk after devm_request_irq is called?


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
