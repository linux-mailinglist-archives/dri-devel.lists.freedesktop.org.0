Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FEBA766E7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF610E027;
	Mon, 31 Mar 2025 13:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DFmaS9sT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DE610E027
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNtWYuxrj2/KegfoklealXJPk7KKWnHqk++GTPkNveaDHiMuvv10hfvNylQSXU8DRmWdmE9wIGhd22sw7kP+OGNusIkDzehF81gcRHiVF51nmwJ4SQcStp8/11rJmdnqNRfYlGRmLpOu56RFFj0126YhhiVq7SZtpaXkFVoBqU+3CYdStWho5fWRcjFB386J1SJhNYJrjE5ANJMg8nloexG1gQ+SUGOW6v2y2kqHZVE5nvFE9aAb+nMMcVBeUUqQ1Wybv9a4A3nyhjH12jXXgxvZR5qRJdt5iy2PQR00hfL9AgPc1QnWsTlzJoV2eeZvwYgjWx2wNUpRskEjFkKqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMEclAkqmKiJFSFtKcUgrGdyGQtGOdqkePNWWm1EguA=;
 b=PdHVRtU2Yb2Zz4ohsMgZj9mGkil9OvdZ728qtLm/Jyi9dqLpA+ZP8Ive6KA/Vd3Vftox/7nuSFsZ/BRHJsmDN5o+HMV1jfUwyeAXJqxaSPltiuOMwy6lYkjqzu5wd3Wtx9R52KB3eikcGFITbJs1Qjh2WyLn8LWumZCD2LGP/j5TQmyq206mIAygNaS2V/UeQoEYgA91rubuXLP+iq3BRsWBne6ggqm2aqI83f1c8akTX14xsQKD8YKFMPqslFdaTbsUdXYmTw5nofortuZkk/hSLQUFdZyiSW7t9qTV/3nHJ81/BpGkUeJGh+RO/FlTeXfVizlqWKVdYgFH26Zl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMEclAkqmKiJFSFtKcUgrGdyGQtGOdqkePNWWm1EguA=;
 b=DFmaS9sT7NBo6O6yvcmYnsi27uVoZatv44ublbiG2LQVJrQwm66Syu67YTxfPo0aZ4qhd7fKA50t2BqZnv3z2KpFhr0Et4Yi1rQtB0wqdlgcr3FDew7+mJt0squ7uVuf5RevqQ5mzWPE4TfdOrfckP/JNwC/clRxJgOlSZ4mjZbaBKOojoDUvMS6ZcuqQmOngpE+qiMHeskNhHs06x1idcPfxZjepcNBLlDfxi3RLLQDGoD5/tcEJeR7/jZ1ZBimuioC2h5vSPJu09eWsyVgrst/H4bUKQ6TiKBwLyar3R9MS8VbXCJVDp80UrmKT6EvrhHtTsTPBSpaUEjPs+ve3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB5961.namprd12.prod.outlook.com (2603:10b6:8:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 13:31:43 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 13:31:43 +0000
Date: Mon, 31 Mar 2025 10:31:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <20250331133137.GA263675@nvidia.com>
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
X-ClientProxiedBy: MN0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:52c::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 5951898d-78ef-4bb8-7d69-08dd7058603e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CuGGd0yX0aSVVqB92D0mNCjeIHjviV5SWdLkq1EgtBoZExMmXe/fWoLz9lGe?=
 =?us-ascii?Q?yBYlv95ALjI2Q9+e56bs7m+sRMLqMioy6OPGfW/61Vlg4Gq820rbebLSr3I+?=
 =?us-ascii?Q?BSclv+vro546aVjPnX5kzl0MAMfBSgb57Zevx00y8rWB7znAMLPR25HKHKAS?=
 =?us-ascii?Q?/yjLu6uNAWairBsSn4p0cS4xckEm5FjkuuSko+BrkGqfl+1QZFLsKxVPQ6kH?=
 =?us-ascii?Q?FOfrWiiJ7DtsDmxLPyAaw7B/qcH/PXdxzPwUne0+n+OW+uBTINWx8WVGfHuA?=
 =?us-ascii?Q?b+qVEGxPr1VT8b0mYAQK1OFPATpd5D54hv6RvPYLaRdEmZaV5ACpAx3+JBgK?=
 =?us-ascii?Q?3ipOC8M+yQorpoiCYH9Vo+QcBYHF4ZDkDKyDL4A1EOX/X7ShFnmKOoCftXle?=
 =?us-ascii?Q?yKQ5kHejG/BA1uBjopr3rvyjB6fQVLyrmQc//Jqxua18GhZeFEhDCPaFx5uL?=
 =?us-ascii?Q?xTUQ3v1Q7h7RJ3tcgjD1e5dEFtcHJ7mY9VlqMMJIZAhaEdJDY7yAuG2zAVaS?=
 =?us-ascii?Q?6imfAfJKbCNmWO5fQQTyHTXRX9MdwLICUk8eD6uQeIfcU+BJIyy2WDMTNL3v?=
 =?us-ascii?Q?F9PH8P+IlssEHddhS3XuFNYQ+4kxLyLE3Hr87nt9vNlbH16HCVa06PJ5X91+?=
 =?us-ascii?Q?N17MPgjE52cvbb4L6lNkeWokPlgPEHDAR8RL9W6odnYZG3pZOf3A5YEcN8Oq?=
 =?us-ascii?Q?Uxbu0bf0tkhopw4+WiHxHaqfDY4CWPr8ZTNNvSXmu7ws0XHuLdbrq7Bf32Q5?=
 =?us-ascii?Q?4JUOF2jErEUCnj7LwCGmSE5DpVEMNLKHmlxVIg8rlYO4vYp4uK157m8La+8p?=
 =?us-ascii?Q?A4Y1xyUmmVpRpZohalcF9rzUOkv5a2o1Qrlya66eTv4BhsZuIwSDI4ZBtfTE?=
 =?us-ascii?Q?Yerb/zsRsgnes18hkcT3OveFCgV5QWggniGJ9y7+GI3Kx4E83eP53JolVq94?=
 =?us-ascii?Q?HAI2Wy0QUivljmCATRRcxtMzLz8ghnlMRrvqeZ9CG6g1Sp1ts5V44q5LlUcU?=
 =?us-ascii?Q?aG15UdFR51Xrt2RPP1t7FHeJJ8U3SScHGcf4b1UH5NPt5fO2ge4UcyOXOh6x?=
 =?us-ascii?Q?uouHvBpVMKybykyJayAe8lgL2p/jW7Cuwv3gLX4atGR9u/+zWk73olb8JBhe?=
 =?us-ascii?Q?M/Wou4CaOi/Y4vz0TSTgbTb644QhwMB/YiZxG/6OZVYUw/dT/n3zn6ogtK7k?=
 =?us-ascii?Q?qRaGEknekw3FJ92pLACStBSrxGcPx6ldMRzoxPNc+K/tPc5y/EHBHaI6pkB1?=
 =?us-ascii?Q?pWlw51/2jvAT57PWdU1uHi8VvBiAloNfW1ClNVp/qDqqfC9ZUzc2pbDfJNbe?=
 =?us-ascii?Q?RJHYSvln/1Q/nCC3/yxTJEjZVdiePaPqKRN/74eu60c8kB3ed50Flx/R5Ph8?=
 =?us-ascii?Q?YejDq3/TjyQmPcWuodYgsZRkUHck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zfIwaDi/FAVMse7VPwKSUHVIyshEjaxrlxbSl6XuXTAOKIEvKlSwxULUPI28?=
 =?us-ascii?Q?grbD3vTTlfeanVVsZcfqJmwh4gGHsJyJnTYyFW8BKRpGzo+7jWPbztUtjw/g?=
 =?us-ascii?Q?yPjWBG66ps1hlQcTN943RiL4V3NLlHYVuRM5aoDzU50ofauvks/EcAqU96HY?=
 =?us-ascii?Q?wXn0gUm7MFw3wwU9O69yvGcv7f6R8mRhERGzpFC07s8vPWT/36ZwiT/VNrIX?=
 =?us-ascii?Q?VRWTBN/d7lgfdaLFucG8aunZXlCJpGjxVcXOqo9nC0JE0kT0tFridlHm3Iwn?=
 =?us-ascii?Q?VBWS5BFNuY+rmqPHmAe6RFyZ15CXH7DXZMRCNG93lMsMoUjgJMRMuyT28tX2?=
 =?us-ascii?Q?ZI3c3M1+P/pqsd79mbX4cerN7VzZrwYByuayutgOsAIidMrYeS7r9dTuTsj1?=
 =?us-ascii?Q?Yl6agMi8YusukZ9HeGNQ3nlaMEltUjDAslzAsUQLq5COdWrV/WFVQsZY0rKN?=
 =?us-ascii?Q?SU+5Tkc5tC0MyrA65ZEJSqGmOzqnC7FOYgxqxLjqXAWVLuTQZHSCIZvZusMJ?=
 =?us-ascii?Q?w1/Kqpx0G+VlAXqR8KkTququJ3wiobC+nzaUkzYBRVZzbVs8I+QE6WrWW7uT?=
 =?us-ascii?Q?o83RNf2ESja0Dt4rBDB8rew3PB315MhjPSfB0s6u7xMH5omCgOKpJjAotx5Q?=
 =?us-ascii?Q?oXVXeYs9FOrNalYaK2Fkxt0lnMzXPSca3Yl6izcARncfBzcbzRU86ZI/Njgi?=
 =?us-ascii?Q?aczf4/W09Q/fAfcA9dxNbsX6ydUxnRXlyXzkE4YED5TagRz5wc54bfol3iOt?=
 =?us-ascii?Q?LgQ0mp+g9YhTK4B0WBWQubS+G15ESbvqB67Bpcan9JutMhPMZhKXUMV/W/hv?=
 =?us-ascii?Q?y8vGV4nZuPn+XCdmY8v9rrGtjb8+Q0STLiauEffPAbu8GLyfi/nHvaH9Mysk?=
 =?us-ascii?Q?8gqTRNEdUsXMQ8aXJX2RHXqhK6SPLJCbdoqO03SNoliNbvD3vG5mVpiViBBw?=
 =?us-ascii?Q?H6BIIVNNcyBqhW7Ig9onAMzLpQIQmzXGiR4Efv3YB6SoXqVuDKaSQ2S2KlBQ?=
 =?us-ascii?Q?wOUz8ds+6yLUuJiwt1H6xDiPpGyGoB1lMb+A6ADwvsEIDNHugqfrYymgbrcG?=
 =?us-ascii?Q?qNnl+S0HkWghKZnOJHs3me107liYWX4Kwnu7eqebgb+MZ9QO2/MzONJihFTa?=
 =?us-ascii?Q?irXv9qxm0psKNysBQESJ84zUCovD+1xj/M1oJNsk+3Qc19odx6EUhoI/kYSN?=
 =?us-ascii?Q?xLYDQBSb8CgnazxGhGodDmKXlG0r++qXKaMtTqTvsjy9U8Jq/7C9Yr4cJPLN?=
 =?us-ascii?Q?20BY32qIfZyK319TiCi22ATfgiD/i3Od63qQRYk+hc7fFiDxyRVt7QUcFhP2?=
 =?us-ascii?Q?pHpEuPdmri5PvyspsiHRYHoBzjMaDag+S1kdaI1MtvUOdXkuwdPyhPAGVtUI?=
 =?us-ascii?Q?8AqqyiyW33/qjw7J+0w+B8usuy1AX6s2ueuyGx/cDxrD+eh0zUTB86AUzkLT?=
 =?us-ascii?Q?AeRSt/17vFXIE/uDYI3qIpeC4876CtmeCgNUWi/kAHm4ng8PkEM3fIpLBOwO?=
 =?us-ascii?Q?s6MYPwjCQHzllN/V2d0wj1rcBU4d8BcOD46yYz3R4ND7JpAzXzGr5K59jk6j?=
 =?us-ascii?Q?RuVMWYPLkzCwLAihZuIyxgabrhLpg3r7qPphogj0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5951898d-78ef-4bb8-7d69-08dd7058603e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 13:31:43.4064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aook63vTyS5vJHIRhNw//JScS8Ci+vxWgpVf2/hKis/0op646UorAqaS/VCiw2go
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5961
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

On Mon, Mar 31, 2025 at 01:03:38PM +0200, Simona Vetter wrote:
> Hi Linus,
> 
> On Mon, Mar 31, 2025 at 01:17:28PM +0300, Jani Nikula wrote:
> > On Fri, 28 Mar 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > > If you want to do that hdrtest thing, do it as part of your *own*
> > > checks. Don't make everybody else see that disgusting thing and have
> > > those turds in their trees.
> > >
> > > I'll just disable it by marking it BROKEN for now. You guys can figure
> > > out what you want to do, but no, forcing others to see those things is
> > > not the answer.
> > 
> > Fair. I hear you.
> 
> Mea culpa also from the drm maintainer side. As Jani explains below, we
> really want to make this and similar things happen in drm, and we thought
> this much more limited version would address your concerns. 

Please don't keep it fully isolated to DRM.. This new stuff did find
an error in the fwctl UAPI headers around uuid_t that had gone unnoticed:

https://lore.kernel.org/all/f6489337-67c7-48c8-b48a-58603ec15328@paulmck-laptop/raw

I think that was a valuable report, you just need to find a way to
make the tests it runs more acceptable..

FWIW, there is a "trick" I like to use for C header files, just ensure
that some C file someplace includes each header file first in the
#include list. It automatically makes the compiler check it is self
contained naturally. You can get pretty far by paying attention to
this detail and it costs nothing at build time.

Jason
