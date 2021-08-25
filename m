Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A5D3F7969
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 17:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F1889020;
	Wed, 25 Aug 2021 15:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3289020
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpPIZMZPQtwxZ+ULNCBicoRmHIxwoAwtmpJlAKU8MXT1SBKxLwlGTBlRuPKBK5nQbW52TWtfvXTUk6YfLV6xDaEGh05ZismMx/dtF7DdyTV0XZenPKje/1DzKjcqww32gZRvCmuglcjBp5O7Uw63nEzZlC187pk6qtpEHv9CwF06t7XCMK1y6l9dDv54wmJ46cQS/gf/G5ypyndcZRIDTDLVQLMr4L60yKZsYFXSN4n+XTeQRObEaotZMsSsY3yIgJtpsxlF4HH5HBeFXRXz2npXapS4q/pvHhtZt/swYUfYs3JQyE2wnTnhqbXcE0KOPADhTdnw8Nsw0jUoDTM54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB8ls7PhLBIagBD9GH0qEPAo/4hnjUlWRITxP+EVhLI=;
 b=CpSWDsyfOIB/UmmWMlxkpn5ZNjj1ymxsP83vY4aUZdFPUq9HAg8b5pFfY1FM66/KAHTpoTUzRT8ZfFX7ywKt726hhKe1PhvIDV6XZudDdwl8duib9TWSv8SXe0e2gpyw72ZdXieQndOGb8UWp8xwsOGovUBgDtz4yMMRbYPhqQCtAjDqyj/j+KPVC6HTcEsgsDIQP+YeBD6jvqta6lJpzWtCjDvi7OQRaaz2z8TMp+3jKythsz47Xcu5TTYEkwmZSXph9UBCDM56OatqcaGfx2+lG4GhrKuVyNj8fXi2D+hb1A7iG3wSyz5YcrELn+xU2FNKqt5dOOi/3F+dEwp55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB8ls7PhLBIagBD9GH0qEPAo/4hnjUlWRITxP+EVhLI=;
 b=iTXPOke+W3cfEHwi2EuP0BlUaAENwtXyZkh3o3drptJk0YOsXlu0BHm6gxaZ20MOsbiV8/7gshJcTCb19tFtuft4gpO3xIQEQI5kS34xmmFMH/VKzofUigQ0NF6DmZrCWD++cH10QcRfWnqWMTySYiqCdJtPsaFJQqNjIX2UF/8wTzZKy67xDsoood5h+KiuY2eIqOHKrjzd+p3z8CdOVkXdsBbx34ntGASXKVxuKU3/E8m/If70yvCXmpAcEdfipv+HmtQV1jNDMcITCxas6NYd6j2bY533F11Xa+jOqqwkZKpsSLC7Z/QrDmjWSriN0VTM/KF9Xe+OfK/ZscIsHA==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5238.namprd12.prod.outlook.com (2603:10b6:208:31e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 15:49:09 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 15:49:09 +0000
Date: Wed, 25 Aug 2021 12:49:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>,
 Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
Message-ID: <20210825154908.GH1721383@nvidia.com>
References: <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
 <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
 <20210825123802.GD1721383@nvidia.com>
 <9c9ebc3b-44d0-0a81-04cc-d500e7f6da8d@amd.com>
 <20210825144736.GG1721383@nvidia.com>
 <92ae1a45-3903-8228-c299-7ba1506079bb@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92ae1a45-3903-8228-c299-7ba1506079bb@amd.com>
X-ClientProxiedBy: MN2PR01CA0014.prod.exchangelabs.com (2603:10b6:208:10c::27)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR01CA0014.prod.exchangelabs.com (2603:10b6:208:10c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 15:49:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mIv9I-004xtS-49; Wed, 25 Aug 2021 12:49:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e7f1947-307f-42c7-41d9-08d967dfe06f
X-MS-TrafficTypeDiagnostic: BL1PR12MB5238:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5238F9866DDAD6711D878203C2C69@BL1PR12MB5238.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /zKsNangZ3okG8NAiUKr8sDvYzSLupyVgc+gLQnbmefBuMhyQtzUL7Va3ngUWcJiMNP6HG8f1dwaHjOkMmpW9MDKnJ0oY6UlV7o6R6bG7EHfkJBe87erlmrjuX9nCXFzG+2ceClGimi0MZNFbwyPRLyZG32Ca109t/nIiL/rLeMiZBwh4E9NY0ni9PQM1BmBDCwYFDS+k5z5FwGEtGQDWfweoL/jCHAOszPSAOIDlD5cToj62GiEmfdG5UC/x/BpGxN2QePF/i+W2v0G2iAyXqjil02CnskXVNi7wZovYaKb9y15pkReXRLz5bauoHCD08rUW59SUPWThsFI0CwYZuri4ek15UQqsTmA4nZTYI1JiDzjbmny+KgYKJoqdHvWUtTzNQOMGi7ze2rwGkQjtEMs9txuDto78LEiDuZw1csP5LeM+5dt/cYjXavfWVVaCFESJCFFU6XJwRQ7tonTY4tmUSr/73FYu6oPZNZzMFedslPI8NYsTUf3TRDIRJJIO050At0B45pHXsoEeWUavWO+BuLDtbCOWMgDjZR8f7AiCHgpoPMETV+N6omT47w6ZcEOrRdBNd/RMmhmLWTRIFgKd9tzmTyWIezeII5oo2wErKg45eb0+IlZXjeyfIgkp4VuI4cwLCH5LFB420mZgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(26005)(186003)(508600001)(38100700002)(9746002)(9786002)(8676002)(36756003)(8936002)(426003)(1076003)(7416002)(83380400001)(4744005)(4326008)(2616005)(316002)(5660300002)(54906003)(33656002)(6916009)(2906002)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHNjS0M1a3VualVQQjNUczNFY1hEOGRrSzRWVkNPWUxraGo1OURXeXFPSlZL?=
 =?utf-8?B?R2xWTVIzUHg4TnNTWUtGWE1QUEFYSlBxZTZtUWdXVjdOVlJZd0ZrRFBuZnRS?=
 =?utf-8?B?UEN2WCs2MjIydWdsTlB5UnBYUlcxWU5uUVc4ZU9mNWZGajZhUTJVWUJHV01T?=
 =?utf-8?B?elJ0YnlqT05UUDVwQ2VsLzAzaUg0NUd1MXJqK25nZk5Cd1RMK1c2T0ZLZXUr?=
 =?utf-8?B?TGUrek1hazI4S0xTVGVFaldCNE9wLzBia2VZdHRCcUt5akVTUGN0OVU0YUVL?=
 =?utf-8?B?Um5ubzBXMWNnNEdqS0Z2aG54OGpHSVJXNWhDWGt4YjF5ZTVwM0RLVUpmei9W?=
 =?utf-8?B?bFUzb0dMcXl2UldOeWc4eDNobFdSa0VSZnpvaUY0WFhudmpkVHdQRlZvdkNB?=
 =?utf-8?B?d2QrMUdJM3Irc0ZBZ1dmNVdHY1VMSWErM0tzd2ExaVRLU1F0YmE2dGV5YWIx?=
 =?utf-8?B?clBJN0ttekI4RlVrbWJtZlQ0aFRsTlJUSkdxcEkraTFKRFVsMERUZDhrbXB0?=
 =?utf-8?B?UDdBQlJrZlZJZ1BxQmd1MndmeFhLRHY5amlsODZNeDduOCtXMTMwOGRSVllT?=
 =?utf-8?B?ejVEa25ub2FGck5HODUwNGt0NzBOcTZCRXpnMit5KzJ5WmNSZW5YbUFHeWVO?=
 =?utf-8?B?aWJQTFhuaTJoV09ab01ZNjh4QkxHbjA4MEMxSFBTYVAvQ0dKLzdFR01sS0My?=
 =?utf-8?B?SXNJSjJtbWVOd0R3bzVkRFdId05Jc1NUM0wwbUdiZ0FvQkIxMVU2VldjaG01?=
 =?utf-8?B?QUhpUFNvU00yeExzd3NnOGlGUjhUK002bWJ3cCtmK2ZCWUhkdjhzaGdPUHpO?=
 =?utf-8?B?M283ZE5FT1AyYzJ4OEdSVVZzZEw0SUdNS05VZUxHV0pjV3JYQ0lDMTgyc25G?=
 =?utf-8?B?LzA2MGNqeWNDUWY3M2JYM0tVVFpnVGl3cS9OcjBmbTJxTHpxSjU2eDdYZmk0?=
 =?utf-8?B?bnY3U0szUWNtMWNTdE4xOExadWg1dk53MmdzdHpQWWdQYk9mMkNoWTBWTlJN?=
 =?utf-8?B?a2F3NTcyYzNkTmZDSk9wMGU5Yi9ZaEFZZ25XRFJSNjBjS3VTK2hjdi9QTXJC?=
 =?utf-8?B?dnV1ZjZ5U0QvdE80anMxUXN5ZGtNQ09Sb2pJOG1NVy9sMkwvcThTaU84SlNC?=
 =?utf-8?B?enJNUUg5ZmIvZTNpVUU2c093S3V5bkdyeFFJQTV2NVRvb0Z0Qm9rNWRxTmJl?=
 =?utf-8?B?WEQrbExvYUtWNjRzTTd0a2pLblNKdTRObk45MDRDNGV5MnlJSXVteTlYV0ha?=
 =?utf-8?B?UGM0OVRNdDZUVlZKZHA0a1ViM1pUTnRKN2EzaE9iVXMvdS9WUDBrSlBBZDhv?=
 =?utf-8?B?NUZzcEF3bXhkdFdHVjlLVU56V25hdUVpQlRGbHUxdS9ZMWRDeWNrYVM4Q1Iy?=
 =?utf-8?B?NlNoNmd6OThFd1hlUC9YVUNjQUYrN1lWclRnRTdPU3N4U25oUUMzdGd1cFB5?=
 =?utf-8?B?R3VhU2tyWlV0NHlHUVZDTmRQOWd1Qnh0UTAvdU1tdXQ4Ynk0MXFJNUdlczJp?=
 =?utf-8?B?SkpUcnZwWTZXb3Z4YUZSQkUyelFXVDQ0NmwzV0ZnbHBqSnpKczFaN1ZFZHhN?=
 =?utf-8?B?Rk5IdjVkV1BPK2EwRFB3Z3M1V0dSYXkxSTdBeE0vWHlpSTIyOHJSWVpRVHFP?=
 =?utf-8?B?cFlKVWtXZGU1bm1OOHJXbld0WFpibEt6Tk1sdVBvNVJpYU81NytyUzM3VG1x?=
 =?utf-8?B?azdrdkFPWDA2WmlwWGtibE5XRnZ6VGlseFhhVUt2UWpIWEFScGpzUHRSaHoz?=
 =?utf-8?Q?rH+ucSYOMtEqvKoTtE7jBgoitVFTQ/bH38lHsAT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7f1947-307f-42c7-41d9-08d967dfe06f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:49:09.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ecP/WlWvbnUCDejauyDVNQkgDmWuVG8cRgXattUGbZY4D7R5QUP6pE1zP3uWBLHC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5238
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

On Wed, Aug 25, 2021 at 05:14:06PM +0200, Christian König wrote:

> Yeah, that's exactly what I'm talking about by adding cgroup or similar. You
> need a knob to control this.

We have the pinned memory ulimit today.

A pinned memory cgroup might be interesting, but even containrs are
covered under the ulimit (IIRC), so the driver to do this work might
not be so strong.

Jason
