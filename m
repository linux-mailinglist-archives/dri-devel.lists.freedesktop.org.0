Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3D78D7D3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 19:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863B810E520;
	Wed, 30 Aug 2023 17:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BA510E520
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTVwQIE/+bxobUwfXeB9xcC+mFUTzNQdi7+cqIiQVpAuE1xE9D1r51xT7TqdezkCmrMKAHP1g7zpAAjgPvnJf2aaTyAGY7TzVooCtTR0Pd7MbXDqm4Cb0puI4xU94V9lklweLR7R1NMkAueh6JCGIMCCAUdCQLlaSqpSkPe7yVTgZc4X86Urc38drRGcqlxFTA3B7L0/ekRrZs91ULw9V+2nQuyeYVlp4SS5DhdhS+xYaQxI2wQoaG32TWoVu+ckEy9HdhPHHfD8lvCp4d+eR0A/NvQ9JuRT42MUm95K+asBA3x7IVi8zssgTpRVryxx3gxXt0bbts2GXf/+eTfY+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uz3j94cDZtRakVgLqV2jWgh0QMQc9z/elH7VieZ38M=;
 b=G1PDfgW/Wj3kduY4IXUcsZIfmc5+T6LoLNGnEnDoG7nI1c01UXqvwnF0PC5T2ctzUiEW2eg6mFite/VzuM9kX2s8uH9hkBsqfSgDXl8wiSbpOBIp8KzazZY3LnJMIs1c3opddQBVD1tMdXA1O/CqdUB62LgRWVj402KcMefK0JrKWQBsgeIN89pbaZYz/Zd1jFEbh/tocRDYuHC1zOlahFEEpii02fQNFlfhrww3kjhZedq4H6mH9I75P5NDe2bTk42kx92XfAqHBha7ia5b61tZdxhOgNhoBO9rDDjP/hAYnWy4fCFydfW/YA6orvMtKrRytaJ5bCiBTciJ7SBgng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uz3j94cDZtRakVgLqV2jWgh0QMQc9z/elH7VieZ38M=;
 b=eLmoACVlcXY06UgvLTD5vfldrFIvGTeAnNyDUQRs/RyOZkW9Ltb/sy6YabWoaDcA03L4LwRWCq5tHmgMXwdIKvZTPI1oWKdhOqSU0UTfcRRffwranqVhYnLkqh2Xw749NdBNH94KWT2FOsRfCGly4KO9kYOWcecVLRGmBuH16gct0wGh1iBCnDf/ygrifl4FZdi3VzkheHW8BNpSgQiR+o7Sv+5xWC1YGUb/MJ91tF/Mwpj36VD23tX6ETnaCv4GBCCX4iZNUawmNxIHri01Qa4kAWE4eF6dfPcgX8n+jd9k3G2gNtj3HY2qJeYOkT3n0kG9ep9QMMRVozUpsOvvAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 17:30:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 17:30:24 +0000
Date: Wed, 30 Aug 2023 14:30:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/3] udmabuf: Add support for page migration out of
 movable zone or CMA
Message-ID: <ZO98rj4y0TA4+CfO@nvidia.com>
References: <IA0PR11MB7185ABFBB06771B7646F8F50F81FA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZOSo2cuw1ashK3+Z@nvidia.com>
 <8afa35bb-c3ed-c939-46a4-a9a277b6d4e2@redhat.com>
 <IA0PR11MB7185B7B437E98F7F594D3E0EF81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <b35cd8f7-e7dd-e47b-112c-62ee84c92768@redhat.com>
 <ZOeh4x58eGel7WwI@nvidia.com>
 <20e38c1d-24e0-4705-6acb-87921962ccee@redhat.com>
 <ZOjlBGcj2VMP+ptd@nvidia.com>
 <IA0PR11MB71857A044B51DBEBD7D131F7F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB7185D5451D4DFBDFD4C258E6F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR11MB7185D5451D4DFBDFD4C258E6F8E1A@IA0PR11MB7185.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT3PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: b0fdd4f9-6d37-4bf9-a95c-08dba97ecb4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQBaEeFvCGx/liwXc7zD5cS+92acNxqv/e6wNTT4Hegwyt1IuNLHucm2LxzkVy/C6AXNYl3I4Gwa1hzdBATVayQUFLGQ/uelCTu9lgLW8OFjqJqCoCNgEFnP5vc13zvzRlOMkSn3WcOahwPMwRmt+caEqD2XKHKY1EppWplX43ctLiupIaDjT61eLvGGKcAamI/L/ok33+scSQQ3hAaZmi0XvD+3N5q/djrwjPbR2FEnY5Fa3SoHGCnlU0horoOTRfK2ReGYVY9rslkAi7K41oDzKyjpy+YolbF8K+7r73EWOcT3JoDldG5yQh/LzzjZ+lbRgyhIwK0KCUVvihwcEz6A1r04PiLlaQK/0A2NZ9Ilt2FGWdqxUqjVh96CcnI+JYoDzsc1vVmUtEHqadUhZ8kJncIOOUov+C/mAa++hpdd2mev9OjFD/1ar0cUkMszJqZs3S0RQbLiwTyDmUUp4zVtTIGYVI4OTOJRlNzbpMDFZopLP3AE1oRTI6gy2+751s1oLFPjmoo5Y/fmSzZLDyoYa3l928Iw4Vwp3AWvrNdN6FES2ioVENNA16OoKrVEUYAmMw2yU9FnQCBm7Rrk/Dq8bVJznpI0NUmnYJzw2ps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(186009)(1800799009)(451199024)(7416002)(41300700001)(26005)(2616005)(38100700002)(478600001)(86362001)(83380400001)(6512007)(6506007)(6486002)(36756003)(54906003)(2906002)(66556008)(316002)(6916009)(66946007)(5660300002)(66476007)(8676002)(4326008)(8936002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?39ZnLY7YKu6E0I3x8WEqbuBmhWqUAZ3Rt8w5OZPx3BwdE0txozub+IxIaXoD?=
 =?us-ascii?Q?Gvp54UxX4pme6t/qCHY2nAf4ZRkAJ5bs/fikL/i6guxiYFSjIaQ+GHjSpldW?=
 =?us-ascii?Q?zrPntOv0k/NWklT15GOkSKhV3F/Uswo6TiE6dUd0+1jo3lWjGhMfa1a3H8lZ?=
 =?us-ascii?Q?QGHukkxl3k/6A82JeERibyeV1NASdi0Lfe/uVAqKq6s8AelBQh07L8K7RlR8?=
 =?us-ascii?Q?IHn8uWMYmC01aIjKJV98ZqClC65C4JQYifTWLcAmeIifgdsuyWI25ZQzcJTC?=
 =?us-ascii?Q?iGfwBb/iyg6V7WS9oIdxDutqHdr0SuVJ0vTI65g+KQb77Nc/l777aTeyAlJi?=
 =?us-ascii?Q?eTu34Gn4SLLi7Me8/q+Hl7RBh+vYUvwBLApNLx6bVhmqiCGfBOTZNSBYS4VU?=
 =?us-ascii?Q?QGFJyduAn0jCeVBT8qmMXz/siML/eN2Yo8Gh6SvPzE70+cZVBJku7hE2Ja1r?=
 =?us-ascii?Q?uVKTyP/dWP1gCb+ElXD0ELiIAZ/vLDU11viiK7aN9ozz7hVyE/g6Bp7pUJ5o?=
 =?us-ascii?Q?y7lthYdGJ82PIS8+IzPyBWnzOCfAM/pcPhaW0DWN6AjMg+7HUY9o+OpTXbhE?=
 =?us-ascii?Q?K3QVJgEBRv67ta0fwRX85EJaIPCizZuHpO55KoOLz7f3RIbpcGbFbah2zTfL?=
 =?us-ascii?Q?DL1LiLaajVI79RdG7wQC5cULafCgosfhJoTpQ03gOYqQc4LvhTNXGZbFgAWH?=
 =?us-ascii?Q?01VGdwIcW8IlevIPZfaHqbgkFGhBRilvdRx7cLfFCbWpIAtqztwW+vBDmnHa?=
 =?us-ascii?Q?YRLVTXVmsz73FHzaBO4Ai3m3LFGH5LBCFy7Y7CoNTU6ljCu7cKjRg0W3qQAj?=
 =?us-ascii?Q?RjhXpagu5nalzmAXwNhhAy+qoKLh6HUlfNoQoBku1pFY9TXAjugAP0wWSaE9?=
 =?us-ascii?Q?8NW4hF65JNB6XqHcX033XU1wE5uLL/Cn8O99uTZm34P/BMrSqwDl59M4/oZ4?=
 =?us-ascii?Q?yAjr9RLKxVVMyjZWiXxGEEx82gdaoc6pf0+6A/SneC7uRS4bZNi85VX9HEyq?=
 =?us-ascii?Q?HCwaY06PEth+g3zXCt8ILENYGH8KWtxo23ZwZuR4i1F1eD2HGY54/zNrk2uL?=
 =?us-ascii?Q?1EqNlooEfmrK8YnpSjfKCfhRPEGN1vAuQJeqmrhObp6I7dMEzmne/k2pU/wz?=
 =?us-ascii?Q?pS7Wwxgw7pDBYuXV9TXbDkb/q8O448+PWCyJKfIAKfEnvVQK2h5t8xw9IdLh?=
 =?us-ascii?Q?4IWI03m8Mny9FxxF6eX1T40sSwulnFk8B3OGRuqEDA/dc1BprTUcnMl68B+Z?=
 =?us-ascii?Q?sCn9Dxtb4t+6PRxdjcpf7yY7Zy4YLHKlwSY+qp/wUBMQ3c05ImMqdKhoXi5w?=
 =?us-ascii?Q?sTGGwdjd40oaqRqPNy9OyH0Kyb/oZW95yUlxhs17aZI3cjJKGErjr8mq8rPs?=
 =?us-ascii?Q?+FyOhgVbrlckJiPOYj6Zd3IYOT7wbeUPXZUTK/10DYZ2jqOAmXNXYNClZcCc?=
 =?us-ascii?Q?PKglPb0Xd303ZJCt99WCU97jiCBmNOmKlC7xAGiPqc2+HuEnAK9jMJShdKOm?=
 =?us-ascii?Q?vhqKJ+cHRP51clhfROctMYEylcME71qWmmE1YV+BIT1BBhQ1M3dp30HN2hQr?=
 =?us-ascii?Q?CxIxzZwZGKSWPe3KU/PWF1G12uHMaj1KzxbTBds2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0fdd4f9-6d37-4bf9-a95c-08dba97ecb4f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:30:24.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuxD6RCO8flnAwChH01ZsZeFTw9zgl5ggnWW/Zju0ljaB36MQCl07cJRl/olOxnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 27, 2023 at 07:05:59PM +0000, Kasireddy, Vivek wrote:
> Hi Jason, David,
> 
> > > > Sure, we can simply always fail when we detect ZONE_MOVABLE or
> > > MIGRATE_CMA.
> > > > Maybe that keeps at least some use cases working.
> > >
> > > That seems fairly reasonable
> > AFAICS, failing udmabuf_create() if we detect one or more pages are in
> > ZONE_MOVABLE or MIGRATE_CMA would not be a recoverable failure --
> > as it would result in the failure of Guest GUI (or compositor).

Yes, you can't use whatever this driver is while enabling MOVABLE or
CMA in your kernel boot.

> > I think it makes sense to have a generic version of
> > And, since check_and_migrate_movable_pages() is GUP-specific, would
> > it be ok to create a generic version of that (in mm/migrate.c) which can be
> > used by udmabuf and/or other drivers in the future?
> Sorry, I accidentally sent this earlier email before finishing it.
> What I meant to say is since the same situation (inadvertently pinning pages
> in movable) may probably arise in the future with another driver, 

Why?

It was a big mistake to design a uAPI around taking in a FD and
extracting pages from it, we don't have kernel infrastructure for
that, and code liek that does not belong outside the MM at all.

> I think it makes sense to have a generic (non-GUP) version of
> check_and_migrate_movable_pages() available in migration.h that
> drivers can use to ensure that they don't break memory hotunplug
> accidentally.

Definately not.

Either use the VMA and pin_user_pages(), or implement
pin_user_pages_fd() in core code.

Do not open code something wonky in drivers.

Jason
