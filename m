Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5802B1769
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABE96E497;
	Fri, 13 Nov 2020 08:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2102.outbound.protection.outlook.com [40.107.223.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EACC6E323
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 02:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRjX0jmCBMpgF3mlMJ3L05XClwJc6w4I9VRftnOwhYDT7B+1I/zcMFRAaRgtEC93LHYKJbaxsr/JN3BK9p9jzQVZY2S8NBUEokxkKWV5/NjWt4E3Rk++dYxcgys2uYnpzAuDUDV0sqXFmiHTg6v/bD/hOt8UPjohq0fEI1MHy/3L65CXaxos49QQ0oILxF7LCs48HjCT01xz56d2ANYF0gCMByXY63aYD472/OhKrdgqll/OPmqPAdDvPrEklUnlNM432SJD0oJa7ahSvmb6YcH1FQpVO1OrZcgDFAeGQhs0inmSusKSPPhXkej8xJ8bIyzd1/a3i0Bs9BZFynS6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6Kk4wFkDYgJY4/Xb10F3sjCQ6Ynx627cYhLhrYFZuI=;
 b=YL96fzEIWUOrQrYyFlH4/s2rXiAbnlo7ERJ3hzSvIpolJc2RTh5j1zp2/y4hhckKxFxL6UboRyt29MCnMQH3M1AjULSepIyuIV0vay3OegxKY989ir8Ul/mUgDYT6P7EhR/VZvDNMt0zW56+mvKlAiDWhs+hKO640FLNwcwbdEFIyFpN1PaY1U+oEboBQ79pyFjsM2iJW/JtskexEdvEizqEomWetei2Jk4m8/RlAGDiOa6UCHlWms3WeAcRXZR8CJWlLTu7MmUCJzbTTIoza6JLQA3Da130O6PgQ2vuvYrtCv2P2UMynYuSqQCkhzLX91KdPVujTPrqnLYUGs/DiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6Kk4wFkDYgJY4/Xb10F3sjCQ6Ynx627cYhLhrYFZuI=;
 b=dQeswAVHKfXjwyLbS1U+OfJWsUK1z1+7eo9+hotHEZ8BlOynhUJ93dhu7zVYnDyq8oiwE2yETaVeBC9kHZYDrGd1xTB5RXebqfA/UlnzZ71Yy2pzjAbUaei3OcKrNye5uizR1/jSGkjPlp2h/Vf7ljlmlWpmCUngTEQB4gPePLc=
Authentication-Results: siol.net; dkim=none (message not signed)
 header.d=none;siol.net; dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6802.namprd04.prod.outlook.com (2603:10b6:a03:22d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 02:34:43 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c9f2:c0c7:45c3:6cfb]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c9f2:c0c7:45c3:6cfb%7]) with mapi id 15.20.3564.025; Fri, 13 Nov 2020
 02:34:43 +0000
Date: Fri, 13 Nov 2020 10:34:35 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] drm/bridge: anx7625: disable regulators when power off
Message-ID: <20201113023435.GA1948@pc-user>
References: <20201112083704.1173908-1-hsinyi@chromium.org>
 <20201112083704.1173908-2-hsinyi@chromium.org>
Content-Disposition: inline
In-Reply-To: <20201112083704.1173908-2-hsinyi@chromium.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [114.247.245.146]
X-ClientProxiedBy: HK0PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:203:b0::25) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc-user (114.247.245.146) by
 HK0PR03CA0109.apcprd03.prod.outlook.com (2603:1096:203:b0::25) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3541.21 via Frontend Transport; Fri, 13 Nov 2020 02:34:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96ec1092-132d-4b9d-10b0-08d8877cad74
X-MS-TrafficTypeDiagnostic: BY5PR04MB6802:
X-Microsoft-Antispam-PRVS: <BY5PR04MB680225CCAF40E001BEFA27B1C7E60@BY5PR04MB6802.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2EzMw45MoUOw5V9DWUKb0flnRMFm8DFoNbWrAE5/3ahj3bAxE7ywkXL6Oc7XGA0xzDsoj4A9LkMmw+S7fFxwW8aE6qwdY2PqHeD/LyM3SGJxF2i0yxgue0sr8NeeqcWrHxRnTefeAAvoSledDsOJ4a6rQn90VdA5C59T0q01x8+MVDGDYG/ud+3gCWsGc3xDW2rtTvRrOrhO1OB7NOB3MhCikfjDu7CVgKmPqooKe6n6MQ+cakOVjyV0cfgVFKligtv2cbQ7HAugzw0YS3dRxon42H4OaK6H/TviJ6d7ovYBkiQp1Af/kS4vb8bohWkIWKK3s49mzupyKraMbfZ23g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(346002)(376002)(39840400004)(66476007)(7416002)(66946007)(86362001)(54906003)(110136005)(52116002)(2906002)(186003)(26005)(956004)(9686003)(6496006)(33656002)(33716001)(1076003)(5660300002)(83380400001)(4326008)(316002)(8936002)(6666004)(66556008)(16526019)(8676002)(478600001)(4744005)(55016002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 0JroEUY6xTgdGjlSLA6tTYn1iIfDa4NvsXb8aNPcpp7bFpSExcwQqHOxbtw9bbLFjG5I8tQv43A/lWhz32G5ozfxNT8lutWohgsF/aCojmd5npDKjl+9YOETk8PW1yLuSFsTricfY7g+LjbKjJGrdj8qyq207Kzq4jbq/sF/YAEnu1aGsF2urmASU7KXW59DDCdAtg2f6dspb4HJ9ouzr3BK3SDN2E/OqTRVpWMeXOEPjHlGZNhM5z0K/WQz6BLIFagGIkUR7teSxgr22P2/HQQPPRKUBzPx3ChEzui4y9aSagQaxxlYu2o8/fhCILE6k5takWJvhoewbwvaLpZN7Hj9rn0sr75T0Qra2O6z9EovcmJaWEhH7kSK9Bp0amb4Pm3M3xZ3oVj1UFk7CXg345rgzVewIVpPjW1H+HWUVPfZM8RMPWZNywWxpImoG8ck4zj0vIvYt845Gb/ZLMkIADAIyPj2m3oBUQel09UbpUyjnvtV8EzIrodqWPL3I/bI8aAikGnSJZqDSwsNisg8gs1Hk6kNweXIIJGVe3hmIE3Ks6nxZVPgnpOakmbq6G8Ohi8carx4Gyfl6L1Fv+TM4dqpv6Y9qs63S5rNiyptHyEDFnf5R6GiBR9nOK0J/wmxwl/wmklw/Umorp8UnKdmiKbXNIWpdVlpfQfuxM/g0z813hhVhMWO1+DkHDX2ZSiCPWHT5tQnq0Q42B0nrsed9OiQ81wul2ICGxG67irGRhi8yG603fjeProrc97SFCTBo5sH3ZT5yScMlCvEjywC039qaxUpVWK5l1iKhWpCgPMwb2cTVcMy4Tnbpowmq1g5YBizSEithJVCkudSrXG1kmX4CvXnQcm8/Ue1VqH0GUyaQ+LYtwpQvy1vMy20at6tLAuRj7blZnfUOH8JM77ctQ==
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ec1092-132d-4b9d-10b0-08d8877cad74
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 02:34:43.0725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuAAJuRmaYlDSVTKSvlNHIebujCtFp8pTa7spgllbpB8/P0kCotw7brskrtTRfwETSF7+NZUyacRiI688z7qkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6802
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 04:37:04PM +0800, Hsin-Yi Wang wrote:
> When suspending the driver, anx7625_power_standby() will be called to
> turn off reset-gpios and enable-gpios. However, power supplies are not
> disabled. To save power, the driver can get the power supply regulators
> and turn off them in anx7625_power_standby().
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 25 +++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
>  2 files changed, 26 insertions(+)

Reviewed-by: Xin Ji <xji@analogixsemi.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
