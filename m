Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A685358CD3D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 19:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E1210F8A9;
	Mon,  8 Aug 2022 17:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD2E1138F5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 17:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kql/kc3C/HIQAQjWGr+B5VsaUo4SsS6Yk+VMecbYb6/wVA5CGOqR4mJNBWdFW7jBskS1NJNb+9WgNRfUc4G0hG8SPd94YGwhtKfEm/ud6pMjJwV+t9bx7MCL0oa0N4gIUWv5ZvkPm889TspEm0dW4I7NF/8/kuQnwvCZtCe6+NuP4lmV4TRdArzSlhpwaSaLwtdv6syOVVf8+Kr6tMWX4wVTxrzvxlq/TK5Nmfae7xuo43CnRoS84B+y0D0RVTlTxbnalJGITUPjgi3RlDW2arNN9Qe1MpVDIYGBm7IMf/5MO1tPaq+KiSw0WwqfIsFnsTdJmdJYs0qF3HdfYs6wxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvTuLlqZpTdfz6++n2TgcdsYiuU98HQgWIMUUuCaa7I=;
 b=QrY+hvBRODRyxpBpBdUAZ1QQV6tGMq5TUwQkFGbUJRQGAzf4oPgzp2TMd0KA+fKLQQKNGSV9L8slXmMZfM3uOPOkeCTn92DQIQ8FSLyO5wc5kpwSCoVxvfqCEJvmRWF5Xd/YhCeuZxgy7BtwcpQFesjAA0LGEhyFHETYC6rrjotwuuEAv0tXcL26uuV74QroD+y+C1nxy/c212OYBiwEFR9xcO7VtFUiD8jqKKlYd+uvQ/GCPGobzNQbS0piH691Ld+82/7E9GfZ2/BvNOp6RIDLemI+9BSrj+lxB5HYDcT4zmRZa8EGMGOJiKb7DBijY5uCjI7sHSvDhIXRJpJZpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvTuLlqZpTdfz6++n2TgcdsYiuU98HQgWIMUUuCaa7I=;
 b=g/hDSMpHqg5SpR82BHz4Wq83e39MVozIvKliMl5EKLZfMpTiIB5Df6Q9Hbyy31qG/Ag6oxqv3wCoRnATjwfWCtGkbmPAPbzNu1JQEGAE0uxMgOfOAgkgxxyr95phojW1YpnAPAFkcPgpeKvEBr9quFDrIRJZPfoica7vjpVm7zC2G7BWcT7qbP0/yQHC9G4xFdKoXrMMsKFdUNx5vq5Ng8Vlv2vTo1lwoOG8/yCQe/PG1azRhOT/jB5zd45Wk+FLiuFi3allyjaT6DMF0Qqs9zGq4B2K+7e4TEnYumZHq1DBh47YaVMt+og1+/TNrBmQYl3/JOW2YvOElKUKcLTFlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Mon, 8 Aug
 2022 17:55:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 17:55:29 +0000
Date: Mon, 8 Aug 2022 14:55:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvFOEPdC9r8QBH11@nvidia.com>
References: <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvCozvgodIY19LSr@kroah.com>
X-ClientProxiedBy: BL0PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:207:3c::37) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbff7d45-2677-4b30-bcc7-08da79672e1e
X-MS-TrafficTypeDiagnostic: DM5PR12MB4679:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHFz3CrcWKal28yjZ1EdBGH8WAvF6g9SzYvSXOg58so23ZCZI1z4NvvgJE6RjqmzZWoaSrMzlENkTLiJYhhuMlgdLEUgzs+kN+vwlxuqZLyXEn8upXamy/BWI1xX/IIo8fxgR3zly+4EcBY7CnXbgx3D9nQXENhn/UrFz9m4GIR9LHCBQTmJnuRaGcf7UJAWBof9hZdmVoqZ8xW9vZtxOzV4PmCHj3/lJ1QwX+zA4POwf/sPrh0A7wG4BN82frKJwOsgqgIkKD8zc89li3F8XXnL+j4JUa8YLAXsPRxGpAU9z5zxxpckb9/+q8xKuLASJWLgE4kE3tbrPKswuAoiWm7FFUex/wQ5R7ZIOxDXqnoX/tsb1Zq8Hn7UJhBcyAxvLAO1bpqOYGPxjoeSbTxlOOaE/eUUwh101BHXNNIhV0SxJtSfTONekmCS0MpDN23+cDUAx3kdjZpkHN3nP6bDWMe8ajpupBJmMUCorsqs+CkBMfxHElJ9nc6zewn4AAc25dyuYFhiDmWIK+z6v1ba6PJIhvHVKNDhCQC0EqD0OFoBkxAKAAnK25Wa6mawSi0aoSuXPkOREMtVVcx8fdAet98MzlRhADcL93ZRGwtz+8UNzh37XTIwMmOWwywQMPpCweSkjKLqi444vJSN5vGEzd3HvK/X/oRJDZENd7+F0oZDFlZhAfmINBBDLCuMJvvW22ixRS+ibIHIFzdkalbmyYZcK1eK0OPrq8dcn/B+2Bg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66556008)(5660300002)(66946007)(478600001)(66476007)(4326008)(316002)(54906003)(6916009)(8676002)(86362001)(36756003)(6486002)(8936002)(2906002)(83380400001)(38100700002)(6506007)(41300700001)(6512007)(26005)(186003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WNHAsvAbbO6AxzW6DGoDugeaqLsaLfHkhSELErAaLHg8xdAhx/CtID1HAvsG?=
 =?us-ascii?Q?oNrHhD0lSC+uMmUjh1qQS8shZackS2Sd9K/4lxCReRUpVWy7MZ7UlZU5Byqe?=
 =?us-ascii?Q?zP89Yq+qVH9KAxqK1cEVgzZbmoMhtRChi+FLTTBEYlyndgRZHK2YfArkFBy+?=
 =?us-ascii?Q?ZSTOapqr1Umi49lrt0O5gxch0UFqiCXBySY8R1cg8N05bm5XTDHEhGgjYx/r?=
 =?us-ascii?Q?6kN8HoccTUR6S9fWgJBzMtP+Bbeajy8ljWi52Rrhvj8qO63eRDv70STRSoPj?=
 =?us-ascii?Q?ydx3XIusr3x5ykUIFlNUWz/9wy92afUumlHQQmiyooQQefG8NDe5Wjda7sJZ?=
 =?us-ascii?Q?hxV0aCnQxIwyu+KQ//6Pw7h4zhcyX8KFT3ec/6kWBGYDXnbNmRFPSn8CLs5t?=
 =?us-ascii?Q?Vauczrif0jLsn5M7cRYK1702gONDXb8Dn2ZJhRxEgfCdz555xkGYyA+VgPA9?=
 =?us-ascii?Q?eQcyzX5XOijyW4o5B8IbtZwaxM7JT6wXFtOndgtbb6f7Um46FjGaEawpjtOK?=
 =?us-ascii?Q?pVG7kE5at4WdLMWjgA3t114hIHBl8zOzFrSuG7fjdr88xtMvAywSwf9JdWCV?=
 =?us-ascii?Q?ZrTJTZaMT3SUR5mUXjCEhtBe9ZDst6eDk+VTwPyEMPOyZ14aj1dF8wMJRcxx?=
 =?us-ascii?Q?bfROhEQTT8ESPQXRGN7lMOuqAmNylp9x7pdzLC12HnGBm7Ps7D+fl/yAa5Pu?=
 =?us-ascii?Q?HvdTZfLwCfTBOP0b/kThmzfe54n4QHwViNm3gm+k6/UoRn7GrSg2Qo0ixOL9?=
 =?us-ascii?Q?F2cxaFUiou4G7A6ppS/hMNPPwnNa3Styl7xhZzP3F+Fi8+837LkYwY9ZbbLM?=
 =?us-ascii?Q?X+rlewVaufEYQvFf1TzVPCE+SgK7UZxCCYJYbGeOa3geSKc3iOrImwV6n3Hd?=
 =?us-ascii?Q?cSnA9tJtd1gpynkljBrLfB0iDuHp1ME6esdZ2/vNUGPrGNkLIvdaLvtmFR29?=
 =?us-ascii?Q?94OEEKAoyPs59fQ7dmFNoDdIso0zgmEUDlDwJgoBFCIkF10r3Z0Yrnaos2cG?=
 =?us-ascii?Q?r+SYAinwojVGqQQgW2TPs34CFe8VKLrTwN/2Gh/QiowSydXL9JKU72QyP08S?=
 =?us-ascii?Q?122GyD/j/0yjEmNE2wL8vFnDFgMNre9PS/YPISXyvP2IGWPc3ttWAvkJ+7Ei?=
 =?us-ascii?Q?KNUDqIrU3Mvh6lAazj0a/X7ONHzZObkM9PZbAOcAQq0XsjDH3BuVL5sz7CYu?=
 =?us-ascii?Q?rCgxtBXBoUCdA170QAgpDQppw2ZxaiyLyXT7yu5rw8JBssukqOnzlLkT3UaM?=
 =?us-ascii?Q?MrbXhHYoLj9q/wPYyF6/7ANyJqtZVT3B3m01Oi/MU16Tm8LWMyhEihme25p8?=
 =?us-ascii?Q?8fIgnNekWCTG9gEZgOxrrMlwjZDRYsUkDhh2INlRBfdlobzBZGEhdmurEbQ8?=
 =?us-ascii?Q?KOqXSkObUf8zBYvCokZZhHp9u3n/ckRCOoG7MR+jrhVyFJK8HeMnOLBHgdGo?=
 =?us-ascii?Q?bAdO71RM8m83ECSf/p4drZM2iW2V42xDik3SXv0XWKj8rrPeC9deMZB9L+o9?=
 =?us-ascii?Q?qq1rkPLEwtKUa0kg+F/aabhSv2+Pmq+ozBUwfPvljrJ6vuHt3fcPCee5NiRS?=
 =?us-ascii?Q?GOAtMasbm+tlv6ciOcnJ8lvP5Xb4Ly+IUH3b53bF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbff7d45-2677-4b30-bcc7-08da79672e1e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 17:55:29.0267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQItklN0/FBhiIlAZlEfvBSAvW2taMqc3HeoEoco9ghUulvf/Shy9/wCQj09Fmmw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4679
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 08:10:22AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Aug 07, 2022 at 02:25:33PM +0300, Oded Gabbay wrote:
> > 2. Common code to handle drivers that want to allow a single user at a
> > time to run open the device char file.
> 
> Note, that's an impossible request, and one that the kernel should never
> worry about, so don't even try it.  Think about userspace doing an call
> to dup() on an open char file descriptor and then passing that off
> somewhere else.

Oded is talking about a model like VFIO has where the HW has a limited
number of concurrent state registers - lets say in this case the ASID
translation mapping the accelerator into DMA.

Each 'struct file' that is created owns one of those HW state
registers, and each struct file is completely isolated from all
others. eg someone controlling the accelerator through struct file A
cannot access memory mapped into the accelerator through struct file
B.

So, the number of struct files that can be created is capped at the
number of HW state registers the device can support (eg one for
Habana).

This is different from the number of FDs pointing at the struct file.
Userpsace can open a HW state and point a lot of FDs at it, that is
userspace's problem. From a kernel view they all share one struct file
and thus one HW state.

Jason
