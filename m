Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2B53FB74
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 12:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F5C11A05B;
	Tue,  7 Jun 2022 10:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD41112D6A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 10:36:39 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eSkmXGYOKujet6y3rGFBjahz9kZ7JSPjhKGWHFSKsT1o20/k4JwV7gIi873gFxGSKz0kyMVKz3NXZkvWNRyNfvBglTXA9ckEZPDUiFak+dsHS6sV3fVBNq+jU5MqvbUzIawHOFNJlTJ9xPabdVYd12GnTz8o80IawrCkA8jzp2yrqfqyKRo8o6EBxEbGgnHqMNqlYpT6mWSeb3G7CDi6hFVeyjAN0lRyA8jL64JPNGKEUv4WDsQ3AYyxoWwTQLj15TxmApvKRusr0mv54E3Db3zpTn3yP1HhlDQLg5QauDGclQGWUUrPSPNkz3dZqoxYTAafujBBLB93OWz2Yd1iJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3m+JiXyoFUJYqW4mFSlO+jcqWkugo+1UjvnPZfPoxM=;
 b=gDFt84vuv9YFi6kUF5CfxjJgUWi0HnzQXw3GpKtO0hC+5UWHfwKZWorYKw/pfNp8u1MrxToic4xAJeiv6zVSp/4IxRTRyGF1Q7jYbC9G/NlOO8ZZzrPjsXAAnPv09p317jZgSsiCQv8oUCV9PqSqgoE5BwbeidtELmQ2oGuG7YRdh/TdsLdB8tmqze7rwxCymt6Bld+cIgJcezfIvgSy1hsmKi8Vn9tQFlaBW4oHPu0859ekyjN55vO+SztMrgavhIVrFe6n3winI4kFoa68LcuYqBVf+hJ/LxD/VnM/YqwA+KrBYONRWi+RPagve0501sL4wSlIWEkLZ+TTGtcG+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3m+JiXyoFUJYqW4mFSlO+jcqWkugo+1UjvnPZfPoxM=;
 b=xjeyih4zer7PLJoGfa6MvEkgz+FmxP4vIgTtUrYHEiltM5LkPls5myHJbpA2qtPv4HEd8ZheoSFCgiZyXTsNGHO4+gPbBI65OCFscyoEcRi6HKzVOENXslAiRD//nWsnClbQTIu5QvJe8Bxhocg6IyMho1IBYzY0TpevYPHLGfE=
Received: from AM5PR0601CA0073.eurprd06.prod.outlook.com (2603:10a6:206::38)
 by AM6PR08MB4311.eurprd08.prod.outlook.com (2603:10a6:20b:b4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Tue, 7 Jun
 2022 10:36:26 +0000
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::39) by AM5PR0601CA0073.outlook.office365.com
 (2603:10a6:206::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Tue, 7 Jun 2022 10:36:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Tue, 7 Jun 2022 10:36:26 +0000
Received: ("Tessian outbound ff2e13d26e0f:v120");
 Tue, 07 Jun 2022 10:36:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e482334ed026861d
X-CR-MTA-TID: 64aa7808
Received: from 5889fbd31eb8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 266134E5-0418-4F28-A148-771E4D0FB2DF.1; 
 Tue, 07 Jun 2022 10:36:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5889fbd31eb8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Jun 2022 10:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFGI6i8sblu9OSIk3Itwl2bo0aqj6w7TtlYhrzUjPRxxIPU5kO7dv3wwJfspZYDktetzRHMqpSP9lpy9woBSVot83rcoIs/nbsFKrlo1+UmDMYb8mBRxcTOIjnl8LQsIjHg6GFHvtvXdN4cd/dr+sSDXlxpK2EH1YU6kT4tKk4ZvOPVzOZs4T2HBWjDL1l1RAEHMyLnH/Alq/AV2eZ/A4yRtRM9/zAX5RuLywQFpBkHOJEIZTG1XBXD9Nfo8zCYfRRDjK2JaSRecTetEylmBU87XjiOlR+g5QB9dAOvfPrhO3E8B5AGNY1aCWFcG4MoB1GbQZYIcRz0dpP6Th0lSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3m+JiXyoFUJYqW4mFSlO+jcqWkugo+1UjvnPZfPoxM=;
 b=WYrSKsJvq3S1omatzlbg3GkPJ56GLr4WK42d3RrZQ1rvwlVqGFOpTmcVnEMZTexIfGy+0qN/QlmYvzRAhR+iPv2yuhwrY98Cn9H5WI9WEwNvQq3MnBHONDow4clbeipWjjvKWt6V4m8gj29GnOAgZOjue+Bj9HG09MfdCDCFRYVDfbGWxnlr30mQPh3tBJnZQcxmIOHnp7RFQP+BENS7+w/K0GVxWqGP8Ud2BrhZbeEjL4Wxp2rG9SgY4LTAgsuRPhO+iFyGCvchHZdlzijcIHf2keOfUNdsaRU1+MXwl2+geGZ8w0cbTvzZe/fUNo90lGc5IJl2qbIx+JRvx5vOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3m+JiXyoFUJYqW4mFSlO+jcqWkugo+1UjvnPZfPoxM=;
 b=xjeyih4zer7PLJoGfa6MvEkgz+FmxP4vIgTtUrYHEiltM5LkPls5myHJbpA2qtPv4HEd8ZheoSFCgiZyXTsNGHO4+gPbBI65OCFscyoEcRi6HKzVOENXslAiRD//nWsnClbQTIu5QvJe8Bxhocg6IyMho1IBYzY0TpevYPHLGfE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com (2603:10a6:10:2a2::15)
 by AS8PR08MB8087.eurprd08.prod.outlook.com (2603:10a6:20b:54c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 10:36:16 +0000
Received: from DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::3424:f572:9049:e32]) by DB9PR08MB6812.eurprd08.prod.outlook.com
 ([fe80::3424:f572:9049:e32%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 10:36:16 +0000
Date: Tue, 7 Jun 2022 11:36:14 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <20220607103614.7ucvgdeprg4yv6li@000377403353>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0173.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::17) To DB9PR08MB6812.eurprd08.prod.outlook.com
 (2603:10a6:10:2a2::15)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 5e79530a-ec5e-4bf4-65da-08da48719306
X-MS-TrafficTypeDiagnostic: AS8PR08MB8087:EE_|VE1EUR03FT047:EE_|AM6PR08MB4311:EE_
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
X-Microsoft-Antispam-PRVS: <AM6PR08MB431108A596E7ABFAB0441E62F0A59@AM6PR08MB4311.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uSxSL/gK2NVnpbGW85XVttryT5mbtL+P3EzgDOkTBAV03Qd5mQlHWzIbDya+z6nP5YP2Ac4zv/9nOT2oO02CJH0/gVKtFIrW8bDZ6QyFz/dl8ILdOyXk9MdvKOT6BzM5RUnLye+Z+/PlzhV/SSSIJ7kwOLuetz7x1ssJtzbw/zjqQYOV5oPbUn+LUI/Gl7GG1tHgkTV9rFjPGFT1tNiDvhQWzIqMeg2cjX1CdyKyCyYaB4W6X7SvhQJiv0fhEdmJxtwaFWnf8EFasYtNc7p0T3zVOp/lbld05v35QBrD8z07hS6xo2mn9FHXITe9iGwMb2lKPTST9kyCju82o6+I4ZIoce7uFQzFKUXzEhpPS/+BN/15p1A7crhDqeyGQJgmzTti5fPysXRrabretS30KcVBgdTjnBub+sckPXIyBffq4w48C027Kto0lBxtJQZ1ctHVnxc9huDQHkjB2UVjOGe86JYfIxQoO8zGvQjTIFRygMjfj8EdgSAaUtnFxxFdKRsbyMmdnZ6x994GR86mzisRPLsGSNfvPvsswa1rFPb8DB+b/q91sPTcmpZViDwO2sJjFlsSgiqz2h9f8T0n1zRRGbDMg5H/wagkfk22yeZr3CTuLUxqeyrkwDlqSu1f/MwqYYCafRZ8dTucMevWzw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR08MB6812.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(186003)(4326008)(2906002)(1076003)(38100700002)(86362001)(6506007)(316002)(66556008)(66946007)(8676002)(54906003)(26005)(6916009)(4744005)(66476007)(9686003)(6512007)(6486002)(5660300002)(508600001)(44832011)(33716001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8087
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b55ec022-19a6-41d8-d86c-08da48718cf1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9RZm75eiVJCED95uq9gDG4rHtcKRBTNWqvbpsr6k8m66qBxECnylVDUKEkHKKjjjpbi7Qb4q5I034Jn8SHPt8sb8w6jU9coSEVBJFGXa7eJUZyItu9raz352BMqB2oseUOrmcHlKp9HCXHQwjy70ALnFeTztmM2X00KwkTMozioI1nEkXSY5fKajxz69GHXy+lWV+CjbFWBy569QxPj7fq0t32jN+IUvE0WWGZJF0VX0z8xjSBK3FrppUZALm1qzu8PESk5+6EWC0Y4a0BO6PKucT7/4tF9bG6DZ+Xkm4p+WC3QEGNcDxOk5YJsrHMuDOSGVpqG8txBEBhXKWieTWuFijWZ9Zd5xokyWzAgo7HIXmbUOhslDnPBGU4cryqWtbuE1WhTwhYPPrJSviV4C4DDmJzcbIb/a3vnjJx1VKAzAmRWnHT5sm1hdN7qgp8I43JJtp5BOigiHg6l6xmLkibZEJE9dGq3IsHdKxF1JzjCTpj6ZKDt8EXRYTGnBqqJ2dfAB0irEZmk2QRtWz/MgpSYL1m1WcH3fojIl9yCQ5TplRBG3ru/DFQPrbPBP0Y1ys2cC+cXO23tx8jcFbaUOAjp8B++0gK5eGKY3+tIIR8EfStdtZjQ9nbHTamzis+lKUZXOyK4KE1DGotK3kD4of9UqXH99oUUqDINs6lX+cLTSxox5hWdt6SybF2GO0FF
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(36840700001)(46966006)(40470700004)(356005)(70586007)(4744005)(47076005)(70206006)(82310400005)(8676002)(1076003)(4326008)(36860700001)(5660300002)(8936002)(336012)(6862004)(186003)(33716001)(81166007)(40460700003)(44832011)(26005)(9686003)(6506007)(2906002)(6512007)(54906003)(316002)(508600001)(6486002)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 10:36:26.0402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e79530a-ec5e-4bf4-65da-08da48719306
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4311
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
Cc: dri-devel@lists.freedesktop.org, Greg KH <greg@kroah.com>,
 Jason Ekstrand <jason.ekstrand@collabora.com>, nd@arm.com,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 08:47:56AM +0200, Daniel Vetter wrote:
> 
> Two expand on this:
> 
> - compositor opens the drm render /dev node
> - compositor initializes the opengl or vulkan userspace driver on top of that
> - compositor asks that userspace driver to allocate some buffer, which
> can be pretty expensive
> - compositor asks the userspace driver to export that buffer into a dma-buf
> - compositor can finally do the test ioctl, realizes support isn't
> there and tosses the entire thing
> 
> read() on a sysfs file is so much more reasonable it's not even funny.
> 

What about dma-buf heaps? That should be a shorter route to getting a
dma-buf fd if that's all that's needed.

Cheers,
-Brian

