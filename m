Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AEC227A5D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385656E436;
	Tue, 21 Jul 2020 08:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4C16E29E;
 Mon, 20 Jul 2020 09:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8vdar3sv6FNjXXesVHGnEXZbTptboNeBxEPSHDHGdK5JUUMHdQVIUZnuja9sA1qQS9N7vL8KAoEG14y5IFxnI1QhMDHYlGWUt/OTbDLq52du/YdTGdAyWfr3TROSsXo36ZTSVU9AhsIU9/ExBSX7+Veo+zYsVLDUPBL3hmCmCGo6Gb0GAH9OP53rhgbf2ynMAXKpTApDBl5C7GGiV97ZMdDfNbyz4MZuodDufi8A0aPsg2fSCPGWlHtXIR9c+6yBNNoZhDLBW+pW1n/BDjT2bNZ8mP5QmOhWTxUdPtwmeAJC0J8aNKqS9fSjkvTQJycyYZ9BzDty8n8LRQVEt3OGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nek5Zqf8hx2vS9vYzikSMCmAdVX/iYhKdicyqZ+RA7w=;
 b=A1LU3owdLwy1hdozXHPZCo02MUsNImeaEpOP+9bzexj0W55nTS2edaYYrJ7etcJMKC06oKg7Rw96xAPBq+IRCM8vTLLwrnKDlLfxmigu7I8fpJpJ9UezXDwWHgIeaagPXZj22F7ZLfwJHuy0N4fIwD6Cuu2TAyFY+u1Ugvpw56wrzFFdCNW1h/EbHXSPvSGeha5n6+kpKATvwPJwLi4isOH4eOU44ye1aL9+D40GKtoSqY6KL/ROqaj7lqNNdISZLEfCidVCqIPoJVUxybfwGmuwhRceMXYrLRRxcEOLiCNTEPo+XQd7edpB3sTb236kJir2uIwhqzt5hVNIo+/eVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nek5Zqf8hx2vS9vYzikSMCmAdVX/iYhKdicyqZ+RA7w=;
 b=jTwsphCW2Uhz2vgCPlAoo/QbWkSuSIDyCSoJzicWemZMLzrzzKkbQfMglpm+OzTatNKYAwY25V3qI939G+AaHs6pi5Y3c4oVJQqu87vr80sTo0pWJnxu8IjxdwhZQvYQREQzjfEJpBmZbBA4bMVvKxUtyjbq8Ic1CdAgcSwvK7c=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none;chris-wilson.co.uk; dmarc=none action=none
 header.from=synaptics.com;
Received: from BYAPR03MB3573.namprd03.prod.outlook.com (2603:10b6:a02:ae::15)
 by BY5PR03MB5347.namprd03.prod.outlook.com (2603:10b6:a03:218::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Mon, 20 Jul
 2020 09:29:53 +0000
Received: from BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c]) by BYAPR03MB3573.namprd03.prod.outlook.com
 ([fe80::b5cc:ca6b:3c25:a99c%4]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 09:29:53 +0000
Date: Mon, 20 Jul 2020 17:29:00 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/i915: Don't force IOSF_MBI
Message-ID: <20200720170950.75c989d4@xhacker.debian>
In-Reply-To: <159501436493.15672.10863611355648667796@build.alporthouse.com>
References: <20200717141138.4a4289ac@xhacker.debian>
 <159501436493.15672.10863611355648667796@build.alporthouse.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-ClientProxiedBy: HKAPR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:203:c8::10) To BYAPR03MB3573.namprd03.prod.outlook.com
 (2603:10b6:a02:ae::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (124.74.246.114) by
 HKAPR03CA0005.apcprd03.prod.outlook.com (2603:1096:203:c8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.17 via Frontend Transport; Mon, 20 Jul 2020 09:29:50 +0000
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
X-Originating-IP: [124.74.246.114]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 442aebe8-4a0f-4fe6-2073-08d82c8f7529
X-MS-TrafficTypeDiagnostic: BY5PR03MB5347:
X-Microsoft-Antispam-PRVS: <BY5PR03MB53472B7CA6A28186D02220B9ED7B0@BY5PR03MB5347.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EkrP5L7WUDKCZQbJQXoac8Y2AkxsY5wxyjIyEw2mW8SIILo41lxg/+BBQfSjNXhn7mqHx0L7XexKmkwaGqQQ7uVg3ncg2TlII4J6218Y+UKF8X+EkeVEDEiqkovus4cYGOXmIRRneEEZR0/fIU0OFcKODPEfB7t0cYjx3Aa2aflHCaLzk9HvRWkoaAze0RFEEgAmZ0ohh8rB1rhE3u1zYyE8FRm08t/nlwWLxVOdRsv41pBJl6Bfbxke4xL/PutFgOA4bt986iMl4vxnlf4xTXhPNy2jAe2oLZ5y8S2Am9bgVNR6+zRx3pj+keNFB8INecI7xwf/mQmRCkQMxs+CwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3573.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(396003)(136003)(376002)(346002)(55016002)(4744005)(9686003)(66476007)(66946007)(66556008)(5660300002)(1076003)(83380400001)(16526019)(2906002)(6666004)(26005)(8936002)(6506007)(7696005)(52116002)(478600001)(6916009)(186003)(54906003)(4326008)(8676002)(316002)(86362001)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ZNjqKIVarPanUTX4KRSDU+x0CmwXqZl4ffDw89Hs1ZeAEnluxc+M6eFY+h92J/nKiss+cxvffbH7sMwSDSwkAgc5DTOMY5rUzgorSFwarD+6g9MypMtmK8zyFzDf3pNW2JsVBFtX9FEkHDZEr9MxjYVT50Fkz4lv7mwrZEaQaaDFLcIhPYIOmrVC1anuBraCkFpsQOthzjDZWrMHRe6zVkcGKxNlODJ3SE2NekaIRbA6kS9/yubulqUbMejvQT2lgIqSoHC1gPVkxFfsshRU5gD2PDDFfDgrBTQieDSrm2F6e+0WJX1jQ24o3K2p8zTimrhPSfaXFqIcSDXLyPv/MxZEZ8TUBKlvvM1Y8k60UjSBHBEiGD/Tr7bLenljEUedThs8dIq5mbIVaAM/2+AZsZ8BIbpku88tG9EA4BiDiw4ZgV/ID2XF9Q0QANZQgozlDAtQUYZloXeMq7sPyDJXcBTJ122yaFY+xr+sqEMPTfzTTQ8Z5EC5SgdIjKO3OqN7
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442aebe8-4a0f-4fe6-2073-08d82c8f7529
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3573.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 09:29:53.3318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+aNbSjdgogNjveQ6Mx2unXum4BKV5C24Y7tZ5Sb2Fgw5NFkCMxZ0G7BFWOO7opRMfEN0smjpEGCKN8uHCWifA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5347
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Jul 2020 20:32:44 +0100 Chris Wilson  wrote:

> 
> 
> Quoting Jisheng Zhang (2020-07-17 07:11:38)
> > The i915 doesn't depend on IOSF_MBI, asm/iosf_mbi.h already defines
> > isof_mbi_* APIs when ISOF_MBI is disabled.
> >
> > Don't force IOSF_MBI to allow disabling IOSF_MBI for non SoC platforms.  
> 
> But it is required for Valleyview/Cherryview and we want to support
> those by default. Tricky.

If linux kernel is built for Valleyview/Cherryview, ISOF_MBI has to be
enabled. The dependency is met there.

Thanks

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
