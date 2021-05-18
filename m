Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E63F387E6B
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 19:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3376E094;
	Tue, 18 May 2021 17:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E1A6E094;
 Tue, 18 May 2021 17:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPH9KU8TKy7rg0zMDRjYDbY+ZD3WM5NztcVJdukQ959kA7fz+v82kO2mmjtQ2K7ig8eWTtJ0nrmQ5Mj2qRfiHojSpdGxsgRWK8hWiAlXrytU524epPdqonIYso8yQdOGHXOHO3K00MnGoRPGz1y84yca3ZmIhvtQfQZi/WO8UBVBDNayqb9JlsxvRgEIVUluMnMn9YdhuLP1Q/DUybVWianLzeOqDzec0I2HG0Ps+DjhJwy0xoTS1GhY8XU2+5Y/mqgWaaHAGGlaW3eU02khIyvHivXeJLeQy7JKbUR7Xc3ntjEq9UYRN44W/Uw7jCK8MAi6lZyYaIpdoZHVV2D8cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lyYEzHwc411tKQHTt35diA9+chEZv1IGr/BKo8ngPk=;
 b=D6uBJCBaY2xhfW4L8UeBUMCSDwYBeQ33TBrOVeDG0SAe5JeGfYS8hS63HePyqLjI+75Us4e4ZDvpqS36mfkZLYlY7uOa547xRkjepOITY49ngoqMcJ2Kt+Q9BN6YtNA447JjNPSBYLyHoMtaTAh2ztTe85yiQ1C3MLPnzpT3gRw6QNx+/9acQZPP3oQzCtSI8QRy1uJ+j/EQeHWVbHE3bZnZaFur3gTsAhO3CTQo7Wo/C/7S2LJQ8DAm3B1ITpmbPW2J4T9LBFeoy9mbg/dc2lWS079PcGoQ7Qevb6qMIe35ZREVD6XSCDwJJVmapApTZmymLNFeydFXBy+qqrXzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lyYEzHwc411tKQHTt35diA9+chEZv1IGr/BKo8ngPk=;
 b=O0kjQvRUtei/gs+5eoWwHMdX0upYEF7xUneoeFjwRFHr1NZeHDzVg3zyYnxz/yzVCMb+tyxOgQ4wBeWox0exe/P4YjDBbndt2oBdpUtL7G5mmNl0zwUNIRTC5vsymuKO0GwG3mlRo4Enk55Qd+Kwzt8EBqetCbch7BDY2S2kzk39b5Q+GXnPxhdTcidEdioXZjXkrmtRCg632Xv1Ze0wckSDXonVjIOONcRCW2WjO7iWS9uUNTcjX/tO14bE2/xi9PY5nsa34GqR+4n6KRH1wqsOG+KfKHUFpfZR/cePJFIPHjS0cstZVjajHYbflrn4fiz330ZaIITZ+kQJskKe6Q==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 17:33:36 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::ddb4:2cbb:4589:f039%4]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 17:33:36 +0000
Date: Tue, 18 May 2021 14:33:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <20210518173334.GE1002214@nvidia.com>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKP5Dj4Q/riGGc43@t490s>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL0PR1501CA0015.namprd15.prod.outlook.com
 (2603:10b6:207:17::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL0PR1501CA0015.namprd15.prod.outlook.com (2603:10b6:207:17::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 17:33:36 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lj3b4-00ANHN-Cl; Tue, 18 May 2021 14:33:34 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f2109e3-9d2f-4e3e-b04d-08d91a2310f9
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB26026BBB84EC134ABB74C321C22C9@DM6PR12MB2602.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 577pwN5sX6Y5yo21fDZYvSk07C0iM0YWU4WRe785YT+sgV6jMlYWm7fi65xvCqddr+iAgct2cUzAW5ZqInLcmYgW1WEhjFKzayrILwJ83HgLdza/+FbuVoxzfXUJ9uTJUTFwmHiH4OMV97I/joZN5ku2hFmdEFy5ToYGDAXy7IfDRYpV+Ovm4DLz7Jcp29VWpmT+KQxv7GoMfT/Ju1cS39wK4KQQJ4HnVaid7EIy9NoUuWKMrOE5CMBzktorW3sRmLuB3zn62vfTXtHc63fNZC4ZaYdX/8b6wpqJg1/tHXCWYcsKElhrDBUSc6NemhtSZoLa8aQDPS94x/eD5HvAmMgfM85HUXfwHbeR1w+yLxUePS090ERkV2DYaAtOFDKuY2wnH6d4Ip59aGmdTu6QsvvU429Y3JApHveAHiCuStOiWjSC30wnWn2eH1pPY0ZjRtInexHUtERL9quBaflu3+bhIKHSK+l0qDnM4RQ0kcuJcRSlpp+n4PQgpMrNP8HIDT4n0rLPddR9a6AtH3fmpm55mF2PS8n7E5tW5aWvhGJkEAHFlahIK2AnJK41Ywj9Lqu5KoRN/daZSxBJWjnKXp+gbrdzTmMkGsjP2d4ochY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(426003)(1076003)(8676002)(478600001)(5660300002)(26005)(6916009)(2616005)(4326008)(8936002)(186003)(9746002)(36756003)(9786002)(316002)(33656002)(66556008)(66476007)(86362001)(38100700002)(2906002)(54906003)(4744005)(7416002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vYE9OxCuiiubnGwuETM0GemkGeapxjJoFooGuqPJwkmOI40X82uR90Tm52HW?=
 =?us-ascii?Q?tp4RN7cuRirsirzuj2hx4Fll4DB9OyMv9xhCJNnYQHiknf/Jtb2oyucdEwlE?=
 =?us-ascii?Q?hPJhZH/wPrFIzWIBPCxe+oo48lDOd4cU9JPCq3dZlNYvimLbWajGnursGIS2?=
 =?us-ascii?Q?S1lfC/no314219A6+mp0kmsCItXWP7maHnYNip1DLtI4PvXes7VaUNM/4y2H?=
 =?us-ascii?Q?WEB9mdUITqJZK1XYtf5Msx953YxOiB7XO8tdxLrN48RjJuMsXMeDKpoHwhRn?=
 =?us-ascii?Q?dCizZowGjhGeH7LzyNVJUlDiAspyjd7PMoGSHgXqDoakyaP8z7XDzzTBl/z1?=
 =?us-ascii?Q?BTac5loIN8NQsMdMpAfAH9vGndw3tWdwfIaNM73TeUMABbDa++Kf1FxmqsAn?=
 =?us-ascii?Q?3psZBTM9Ein39PQxNXbtizhrM588qqHieNAfAkGzeox4ucejm6hDpAnUJcyl?=
 =?us-ascii?Q?7b4D6uLnh3aZrPkRU93f8C4NC86GDwlgbphLDa4SjONaYDWhFRVuO1iOahT4?=
 =?us-ascii?Q?IvEjV92MFdTWnK0WRZsmuttdirJZYObZrB2Bab9SiGNDjeCwQ94uiBOW/qMg?=
 =?us-ascii?Q?Tq3crmOnnO+H6E7GFl4d0gsM7zuU4OjiTh5SmcPVAGRzCYX+XGeoMJNdWwf6?=
 =?us-ascii?Q?SW0YA7FwQ4amja1HclnbfMKOg37XnI9S8TorYfjCBzHHLGGKgnfmBtb55KHF?=
 =?us-ascii?Q?8b75eV+0+wQN/0y+HICzlIbVkhnfQBbus+hEmN0tM9D4wUqD2PZJk7Xx41z8?=
 =?us-ascii?Q?Nt8+4AaIXIUeoKH7GP81c4xtYNXJffSyqwLoQOZy6GmQGQLAh5WVWF1XgHub?=
 =?us-ascii?Q?mjz0tfNl7I44l4jKs4iX5ZGxVOXEP96SuW400uAHkUsxluAPNAmx5VqIdfa0?=
 =?us-ascii?Q?NtZ4pCtU1cIan+LD93+A5H0o0/bSV2Hm2L6MPmvAPwpkZpPLj9Xh64S6zf1z?=
 =?us-ascii?Q?mL4tXahQ/9+P89n1fR0l0rWB+8vK9SSa7/77gKOUNdc6idfxiEXUPdhJaWL0?=
 =?us-ascii?Q?5MGADXL4tji4ErhcCmvinY8jJABHQdkyvC3wBuH2oUpBZp2GkRYbnuqz7NKb?=
 =?us-ascii?Q?3pBpp7SwY6JL6+1KYWwAPbVaErv6G+xQSnsmt+bLLV28p8R7+4sp7b56KcVj?=
 =?us-ascii?Q?cgxcTpT4GG5GsZXyIBi8D10QLXVAYGafuf9r8vCm4DbWzi+zgpVn2eRN0GK5?=
 =?us-ascii?Q?YTqMEidUpUuP7fi8p6heLMfFkJchZwnKyBDup/I33bcHjhZuFvFhg5CJrQ9L?=
 =?us-ascii?Q?OBdY+X6aWQMlQD80md8/ma0f104YJIu2gIadLe4Nlvc9M+RwWkx/QUuzH1Jk?=
 =?us-ascii?Q?4UIZpglyQ32SYTEJWxsvxAqv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f2109e3-9d2f-4e3e-b04d-08d91a2310f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:33:36.2231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7F6hQC3doMWZZzJu9hcL75L5tm+ZGtsOYML4KZ1/2Zz96FzxrNvjUQS1PmEUEwM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2602
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 01:27:42PM -0400, Peter Xu wrote:

> I also have a pure and high level question regarding a process fork() when
> there're device exclusive ptes: would the two processes then own the device
> together?  Is this a real usecase?

If the pages are MAP_SHARED then yes. All VMAs should point at the
same device_exclusive page and all VMA should migrate back to CPU
pages together.

> Indeed it'll be odd for a COW page since for COW page then it means after
> parent/child writting to the page it'll clone into two, then it's a mistery on
> which one will be the one that "exclusived owned" by the device..

For COW pages it is like every other fork case.. We can't reliably
write-protect the device_exclusive page during fork so we must copy it
at fork time.

Thus three reasonable choices:
 - Copy to a new CPU page
 - Migrate back to a CPU page and write protect it
 - Copy to a new device exclusive page

Jason
