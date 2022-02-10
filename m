Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23A24B0907
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A368A10E799;
	Thu, 10 Feb 2022 09:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4549110E799
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmbQzc0Iz/pITxnIanirTae3TpJBMopard+F3wTTmy7MciGF21kFrng6ecRfoMzC24VW4ovACwsTJXkvBhgIfHj8Uqb5mXJLNEGudickNY/ChOzc3kEx/AUPmQdTFdtmzgI23zbNkxuwlsekDC3sD3YfTTb5Dl9EYREVPkJr4O5c6sywlw49KwOXKMl/z0gkQNTloqEds+T+qUzd9XCes6r0Dt9VaYoTzEM6IJ3JNpeRLW8qPb24yLA0GN5n+tE3OTghM6jTKn4kJXdA2SCVpye8Ek24VXp8elUTIb7YRt1/14KIH0Rl0Ux9psNpY2NE9AV5FTnc4YCbB4rdBTWg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUj1NqG0RgwyfmMAe0QmaM0YL/tf5B657F3c+6Xeh0Y=;
 b=oA0TQMyEsmNwyMtJbwEXkvmyFHn+MW1xl+l/ukJSqoJ7u7DL9BaO4jCBcPRDeaH9XaNSpQAUWeJnAyZts3xypBLkxIf7JenbuP5wvV8Z4gHa67uHR6WtDNFS4QpucFPPOJmhn0m5YnrRleGYrbm7AuozklGm7toJ8Iy/ftjE1FJJ0M8YLsJswr06wtpKZlIlToOycYNM+m1TEzJ6rlV81eH0t0iLxcSvyahLjy3cvV8a73NS8DYUrpgmVIpbeeeIfnxkVpvwGpOrPkN7q5ny3ai4/U6NnTKVPloaLWyjuQLjaexqAZTSjvgzZ+u+6/MPRG9Ql48KKbY7UMBmPfEtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=KoCoConnector.onmicrosoft.com; s=selector2-KoCoConnector-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUj1NqG0RgwyfmMAe0QmaM0YL/tf5B657F3c+6Xeh0Y=;
 b=SKfeyeja/r6HnyTdd7wZdItUWqjE+EupJSlTqmC2a6L8sLSJVo2GQZq4iWGMtaY6bQlhlkPTMsO75qNpVMZcDupldQRAaQGpR4y4uq/UrmvgBvxKxEZSj6QRbSPeWTGROFxnhDAsm8rNa9pThJTNGuOS+lfeaOQ8ePRVyARHIoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kococonnector.com;
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com (2603:10a6:20b:281::9)
 by VI1PR0902MB2221.eurprd09.prod.outlook.com (2603:10a6:802:e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Thu, 10 Feb
 2022 09:00:20 +0000
Received: from AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::3c7a:2af6:3623:4c3d]) by AM9PR09MB4884.eurprd09.prod.outlook.com
 ([fe80::3c7a:2af6:3623:4c3d%7]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 09:00:20 +0000
Date: Thu, 10 Feb 2022 09:49:40 +0100
From: Oliver Graute <oliver.graute@kococonnector.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] fbtft: fb_st7789v: added reset on init_display()
Message-ID: <20220210084940.GE10212@optiplex>
References: <20210813062511.14537-1-oliver.graute@kococonnector.com>
 <YRYrPfEHrcvDL4va@kroah.com> <20210813125430.GA1527@optiplex>
 <YRaJDyYquuklht6C@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRaJDyYquuklht6C@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: AM0PR02CA0007.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::20) To AM9PR09MB4884.eurprd09.prod.outlook.com
 (2603:10a6:20b:281::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e348b5a-081c-4067-d67e-08d9ec73c3bc
X-MS-TrafficTypeDiagnostic: VI1PR0902MB2221:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0902MB222156A90CF1D7AE003D093DEB2F9@VI1PR0902MB2221.eurprd09.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXk7IP0Hj+dEdP3yQ1wAWoQxqeNpFxF71ap5/aBeJZe5Tut9ffoPXbyh/NFGw16CNByMFbaugBqNhYOrsyDgEvVWWea8bdM+gnYuQhJxqQkacFrhMSc0bUaz9yF5JSv85fstb/iDkCMhUbGC56mhCWEGZOJ0SPGdHU5KTQvy+B2+nTrglqHsEbkXyoaxjlPuzecqm3mZfHLSNDFvCddqF/cvdAPbOrtkS9w4BZssANyXLjt1zhV69d5oTZFBop26GUaLa9Vg9DLrD/xsoCBtR+MYjcjjbWFkeLqyfxA96MXwEhwTh68MX5DyuhKNV2B6m3uP+Kng9a4qEePToT+mu+FdRzMsEmm06c9X1Y4HlC7YTOfAX73elgcRUw3wpD8oX10LGAj4gUNXPv8f40xwLTIFUS1S6GxbzIfSIXC4Wgqk7xAx1QmyR9Ive1Jv0BxSZFI1C0DXwbWhoSEJ2cnbwp5BtC+YNAJsmkK6YeLFfTO0l8N3IEiVJ/3IzSVMrN2Lv98qPz5orkdUwfMdc4zEABPbtyZo47vj0nH2cGa7s6tXigydJr+scxywd5Cogk/V5r6MaBxrppra63jAY/Zr2wt/g03WWlyvRBHWQwLtBActQN861KlGAlulEdEK08mTNsMv2Ldi+elogb1qAx5/K57mizvds+2OyJLatz2ZJlaQ1YGbQfzfiIRSD/UDKBrG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR09MB4884.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(376002)(396003)(136003)(39840400004)(346002)(38100700002)(33656002)(66946007)(26005)(86362001)(38350700002)(33716001)(316002)(44832011)(6916009)(5660300002)(2906002)(66556008)(508600001)(8936002)(8676002)(6666004)(9686003)(186003)(6486002)(1076003)(6512007)(66476007)(6506007)(52116002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26uIgihGhQnwcr6cdQs/NwgGuc1ifAVUZ8E+8A2uvhmcViMxIdCdUH55j53F?=
 =?us-ascii?Q?x59sYrk4r3F5QoksgyXrFtVO2j21/OvIIWryw5PJrqMCA41SVCQXBpkDS46F?=
 =?us-ascii?Q?hbiEr4uxgpmEESHN9EkjOvUSRRzHuvGnAbv+lGYhvCksIYF7WoFf9+LaTzUN?=
 =?us-ascii?Q?4Dyg2/zqc/2HuTANBNeBIMLy8vLT8hGU9jUDGvACPJWX7hYOWoq7GMjqKM9Q?=
 =?us-ascii?Q?ipTDZjqGfhXkAujz3ao6TzYqtNx3+WUxKsz2DHN3mbbMf5GocmQuwJ9W71gP?=
 =?us-ascii?Q?k8ip/tFsJAGLQ5+CteFi8pLcyfWzuSOa6rGvfMwASRpxSkwdtPtQSI1Rv75O?=
 =?us-ascii?Q?sLnn1ZnP5O1xg/YNV+AbnELbK0CSjeycYbfEusQk7r1Oe8XVCnkox4jL5m02?=
 =?us-ascii?Q?JAqBRzsOsVRj/Tg+nS0H2QO2TQ9igCti/hZ4wlycHVJwuWhop5CTlX+nJmd2?=
 =?us-ascii?Q?E4jHP+ThII3vBBO4L6sIXndrTaAKGj4gYqCi0Sr7CLgR/wfSc7cGEdGMjKOF?=
 =?us-ascii?Q?SuByYQifClilsQprNbj2JLaSQO/VsauLpBLSA7pyV9cUv975AQspBlEuBOpv?=
 =?us-ascii?Q?2yEav935QwqC9Dr/wE9zfXXRBkOg3TU7bfw+ddj2tDetA8LnsN54J2x4NeKc?=
 =?us-ascii?Q?nB5iSbP3NSvzNw+vcOkozngEvkCawBrdbZvu+YZIO+XbTgWuWXJhxiT8ckxm?=
 =?us-ascii?Q?xgqQ5yjXYir4HdakUNIbjIrNzCHNZmLnNeKJsGVVN2PFpo436Pl+DmiajpP1?=
 =?us-ascii?Q?ci5DoUfrKQxTh6fRFBlSVqChSpFkzVPIsudO1OCFR4qgqHo0gBtcLc9niEhS?=
 =?us-ascii?Q?msACw1+6f8+H7wxTN3jjpujE5xDjvsOkdDlq26NIBBtERGpTA3lNCOdwpyeN?=
 =?us-ascii?Q?6+0bs4fBaYsRMFnlXbwA/VZl+qSyktl4FZIpVZdxFx+NDT4JhtL+bSqCUW5N?=
 =?us-ascii?Q?2+crfIFF9FERNo3F4Kw8zEtdHoQkp0smYfkrX7umNCLCzI/9nSl0q5uSB2AI?=
 =?us-ascii?Q?bHFYq8ZxWLx6XlmeTp/cRspHSVbuCr4skRamcOvFHQf6Yp4IpoPPfnw9/KBa?=
 =?us-ascii?Q?kwKx2mJmitIghE6KFOoxK1JmJ5VPAqIXlL9SdUb0oeJ89z//oyYZ7WmfTXDB?=
 =?us-ascii?Q?zXSb36BZGf/juKrjV8aBzrV2ztE940rLyhfkzzFpXy0GFipjqZx6SL5ahRB9?=
 =?us-ascii?Q?JaxHNWr/wSgC2c4drRkz4wqKOksjsdpq0u03qNnPWE2riWK1GZo9QJwbZ5Gc?=
 =?us-ascii?Q?FDq5FaP/rhHQbyx5LoDVuBXOsKqLxDBZdwROuqd3XCA5OuC32S20w2ZxX8pm?=
 =?us-ascii?Q?EYbPHdrLmz/D0sa+hi+1oVWh3Gv5/FUWEbL5vidjATO67bRCeg+u3dEnzUWR?=
 =?us-ascii?Q?zDjieKUN5C3sBwRmfsBmAPyzgKbipN9S2Qg/Iwdo1OvNkkYxO3OA5IcO0iOm?=
 =?us-ascii?Q?dmeA3x+Q1HtU6PIy55pbM2DFqhRKEB/7wOGeK5EgM843xxji/orcHsD7Yucf?=
 =?us-ascii?Q?1OpMXy//7+TbUv5tyJgzdXtoWSJe3foXG/vI/Yx14N0CtFKJoRf6rmhn5iWc?=
 =?us-ascii?Q?+Q6xe0UI5NfqU40JXoJu8pTbS1hflf0fpIo1LOtrfJjO6co7lYyHsSVtdU0+?=
 =?us-ascii?Q?SO/eVIMXQvoq2CZX1uZ+2j6h2A2kRJFGZahaXY+de+/2LDFFGqzH1Ru8vP6P?=
 =?us-ascii?Q?z3dFyA=3D=3D?=
X-OriginatorOrg: kococonnector.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e348b5a-081c-4067-d67e-08d9ec73c3bc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4884.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 09:00:20.2243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 59845429-0644-4099-bd7e-17fba65a2f2b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hL4qpTbfJimjSalbmQw6N5YypjWe3H0IUxEAR5XsTi69XoCbU2TpNqlFrIoZQbM1s0wrYiyCgHamX4SBA0nAamDbhthFlYuC3/qJMhCwuOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0902MB2221
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
Cc: Carlis <zhangxuezhi1@yulong.com>, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/08/21, Greg KH wrote:
> On Fri, Aug 13, 2021 at 02:54:30PM +0200, Oliver Graute wrote:
> > On 13/08/21, Greg KH wrote:
> > > On Fri, Aug 13, 2021 at 08:25:10AM +0200, Oliver Graute wrote:
> > > > staging: fbtft: fb_st7789v: reset display before initialization
> > > 
> > > What is this line here, and why is this not your subject line instead?
> > 
> > I'll put the line as subject instead.
> > 
> > > > In rare cases the display is flipped or mirrored. This was observed more
> > > > often in a low temperature environment. A clean reset on init_display()
> > > > should help to get registers in a sane state.
> > > > 
> > > > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> > > 
> > > What commit does this fix?
> > 
> > this is a fix for a rare behavior of the fb_st7789v display. Not a
> > bugfix for a specific commit.
> 
> So if it has always been broken, list the commit where the code was
> added to the kernel, as this should be backported to the stable kernels,
> right?

ok thx, will list the commit and add stable@vger.kernel.org to cc

thx,

Oliver
