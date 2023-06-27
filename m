Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC61740049
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC5710E30B;
	Tue, 27 Jun 2023 16:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8673F10E305
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 16:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFfTiY07gDcPOF1a3UPv6UEw53keQzsa2vUICLDJcP+E55x7Tah6P6fc/SPxj3qQXyJHSPs6NJcego6xmJqYaKN1RAV6X1YvO/eXpNEPEgeNPYvLsBpW3Qm3hU0/MppDYbbd1aiiZ0ds5rqX8MZwRnjtwYetTrKQtxkn4PAuZLYdveklJ4tI0xyS1FOvCaUzb/DS9InlGoobc6yB5kNrvCaDqkJk+uoz+qsQdXLAqhBAqbxC2ey84B+tFWMbtaUmJ7UDTJpbKfIYie8JbWlSyhbPN6rBX3iOhNqS24d2hoXTbnUiEtvtqrhB3Q4Jq/kWDHqcBcTcm0yV0Xog2xxjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA4EVws/w67mhjZzwV53QVFowIyoyW3JyDwuw4vd8Sc=;
 b=LuZjyJ8InVr6RR9JDeAJFyEJd7/6r26u6gofMcNcSNeaGXc250AHMHM4dRtYZlSH9CdZt0OvQQi8TqdUli/4Faz40Bxkz6SIkuFeZPljWVwnrvQC04Ri+hPxZ2jOfW9BFFvnRXqSfCGk5p8cXuWuu2M7jPO12h9ghAI6vgRFM9iW3OotSurPZ3GjcQbUZL5oGFZ08J6e477tdqoBzmT9lawkXZAeh99Qragu/rGE/wHxlWtsGDJB4ZES0fRSRHQ/XmAP/ErWZod05ymZyRlqgN0vOzFwPi00BjSfmajOEGzAqdty5/A+FunyKvlMFB8QJrNwq7kHZ0oY+hMrtnJJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fA4EVws/w67mhjZzwV53QVFowIyoyW3JyDwuw4vd8Sc=;
 b=q6edWPwcMve8fxJVmjYUJqFButbKl74/MS/DaunlEYubrepyIInbAcG4AQhARHXK4CFSaCzY3Bc8Pxo5mz87Tt5fnTiRO+pIxgS+KTwXfADcXTduJiN+b9/fHKHkRmMkitI0IZo3egdELQcr05fpC2wpzRqpdby9nIsT9euMmyqPa14ElLb230ZCc34imSdnrqem3OXyMbNfGTJusN1+kq62Pn74+T9n9CQNmssA6oOWTEYN6fKlimYBSdoyzDtl9nWaglcXbqE4X8OKzAEfFgBGjj3BnUw/+OZHltsXlnr6IMIOgVoChyn8QnRLmpDAbhhtutep5Lml6Iek6SXc/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 16:04:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 16:04:23 +0000
Date: Tue, 27 Jun 2023 13:04:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
Message-ID: <ZJsIhqD20pwD2WEq@nvidia.com>
References: <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n>
 <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
 <ZJnWiDhrmL0lnyUv@nvidia.com> <ZJnhNSmSv8ynHu3U@x1n>
 <ZJsFwis9edi3dWr7@nvidia.com> <ZJsHpmNEZH8ZhTAP@x1n>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJsHpmNEZH8ZhTAP@x1n>
X-ClientProxiedBy: MN2PR01CA0034.prod.exchangelabs.com (2603:10b6:208:10c::47)
 To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b5e2a6-8609-427c-85e2-08db77282c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +FRSfZmQXom0VFGbYLtf1B04tLkT12CPogf2uz/FIYcB0oWeVEHWQ0kJaPTPpLWY/UPKaXx3u5r8yT8LX10DmjM9jzy4PwIcFfkniH71pTQfZlkSYocW6jM39CDh6R0VJKHvcJcRRomPBm0+sW/aJizfNgyeT8qqgpl9j97hGNrcJ2e+kvir7+e7jR5A/gTwbsj+GsKR3auWWP4GKmkBfmO8tDqT6dNb+D5HSGYp2wbxfvjwUR13BGTv6EN+Ggb/dkK9jxM/2V8ij61tmRJNGjO4o/g6wrdRiMJkv94pyaQIAIWERVLvg42EP4PIYi3f7GW653BfxvDTUZfXkXzIPr3R6CwrnVYe8mB8vXhRweaeb/EMtdiz+jpsxxQGyKB4qKpnmwe0MsfR6Q4Yfzjg6fD6B5jK8DCE40cXjtmW5Vs2EKPzfpKMuvFvqFoEGCNs3yasxp/+fGf7HsWLpfx8FVuXA0x/Ejikx9p7Jhz+wmTXOZt2hCgYebJEev8QTE/du4jggQXcTDPKVhE3HNnCwNIhD/gz+9bUQN3T+13sqxPHbHYi1JE+4peK0HeLW9NX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199021)(36756003)(38100700002)(5660300002)(7416002)(41300700001)(66476007)(6916009)(8936002)(8676002)(316002)(66556008)(66946007)(4326008)(86362001)(478600001)(107886003)(6486002)(186003)(6506007)(6512007)(26005)(2906002)(54906003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UgZpdgR7iyZPciPdFLkT3+M7B2TGTPsuNR7WM7HC5xE1TJtGGzK1bmUM7obw?=
 =?us-ascii?Q?vIqbsjtlU+GSvAG8BnI2VLMEvG70lU2Nb6/tsy1p6jb+cEigBBwPF/4vJbB5?=
 =?us-ascii?Q?eMrCsqXrxXP2dq820HvTGKdoKJuuZP94nvLKx6o1ZfXLouYhfxHJAskVRpmm?=
 =?us-ascii?Q?S7iQ5wmJkvXuGxKFztxNCrZ4RunQbzKKw2EkYq3BJg+SrHt6rOf1nC6ezAxs?=
 =?us-ascii?Q?svDul70KGTCn3so9eb8WRPIBNN3eVRLKzgvgp+A1zIT6PCEVgSrGHE7vvpHN?=
 =?us-ascii?Q?caJ12N/2ZSjvEXrxNmGAgUrfnbKCeezupWIin2wltGIpYP67xTUETqd/qo2T?=
 =?us-ascii?Q?w0nrqQTUXttltl3TTaCG1f8jG9GB3WJol3PoeLJII19Xwy3gtJD17DWaJ3g6?=
 =?us-ascii?Q?ojOGXyzz8uxok6NkICqeIq9oBsNPfd55kjPXpQxYisNfC+mA7qLFdfqVWr7C?=
 =?us-ascii?Q?2fNA1AfsBhcaEl2GKKoDqRBY9aE3BNd6hDeYom4DoFrDjYV000tnJPeWZAEh?=
 =?us-ascii?Q?CBXKFgyBly2GlQGp7VJs5dj92LLWQ9rG4T/Xar7STGbQyAXe8sW2MZSVAZVI?=
 =?us-ascii?Q?dxCy6gVnSK32iMc3BMyp+8zFCM/ypeVkhDhbaVcX67Y85Dyj/uZ9ZhdAdzH2?=
 =?us-ascii?Q?gEzZQrDn2tEXmmCacyivlU7GyN26dwVU4rSlWsAh2yW+Av7Ow++cdJrKiuis?=
 =?us-ascii?Q?h2kd5mAou/k5mJFxxVSKbIFXFQcithKIwharMKHaHhI2BTLkXmLqNRPQuDPO?=
 =?us-ascii?Q?Nw1673SvSuexVKat3KBlvc5+d3msNW9gbncsja7phkZsD402qYFkTSjl/jO1?=
 =?us-ascii?Q?3cRcRL4CYg9l0m7JGt28EUBT7IKczjkSGgzvCbhWkWEEGYwIwGJCNMDf2hVk?=
 =?us-ascii?Q?5rMrPWxhGh91WUTZdx7746C/s1EAUrXHAlk+jGEw62CWU/bAZFykrFLd95hc?=
 =?us-ascii?Q?iZSIErSLJlb0f/n3FlZyc73DQfyE39xV7hnVyKR3xGXX0tV9P/EICjW/2RFo?=
 =?us-ascii?Q?tlz+GHCCrIoXs921cSQ8Z979BbzXR4aIDRWnh0/++5w64j1xRjRIZjuY2Chd?=
 =?us-ascii?Q?Ex+5okqz5veV1rpnKbyolbk1gTKQdnie95m0wBPhPG87jJDo5qbvZPls6ccK?=
 =?us-ascii?Q?+6fKDPmk0xxAblgqGdQnFTQc6JifY3K2LY2AaCpd+LWk9KSc4XkD1GHE4+3U?=
 =?us-ascii?Q?vCSfUre/+ULCb59M+BfGiCKGF37XaruiftEh0Gya/wyJIEhVNuiOwU1QJQWj?=
 =?us-ascii?Q?cbLYfDkZ9Xy/QL8v11mzZBEj92TWR+CaTRmzybIQf/+ZAocMIrj3Od+pHlKs?=
 =?us-ascii?Q?IYTcxbznTk6TdshuZojYisNqWlDMEBNfZu9Cjhd6iwcVNGAglPoQdcOR7s2Q?=
 =?us-ascii?Q?HRFAKhrj9BvsYBqwQQpM8gxm88rVcTLzggCAAxwpkcl0wdlUoJEBIPohfqrM?=
 =?us-ascii?Q?dHYZ5B6i4k8WjhVEk/L+V8aNoqBCL1AbQRi6vySiVcZE7yJ5s2cMXSORdE48?=
 =?us-ascii?Q?5/2eFh6A7YTNScvKQ7amiFTDShsG0JtOW15vKOV7ERLw1MRsFmOw3/SpCZUx?=
 =?us-ascii?Q?3KDcOUI6ujO8NWm8gvAG+YA5voNweHyEh6lTO46j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b5e2a6-8609-427c-85e2-08db77282c92
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 16:04:23.6369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjMA1WuleUFhJ8vst4zdXHwaxR5OUCQ4NEvQxUvzpucUoOwP3A7EiWbpPa83997g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Muchun Song <muchun.song@linux.dev>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 27, 2023 at 12:00:38PM -0400, Peter Xu wrote:
> On Tue, Jun 27, 2023 at 12:52:34PM -0300, Jason Gunthorpe wrote:
> > On Mon, Jun 26, 2023 at 03:04:21PM -0400, Peter Xu wrote:
> > > On Mon, Jun 26, 2023 at 03:18:48PM -0300, Jason Gunthorpe wrote:
> > > > On Mon, Jun 26, 2023 at 08:14:27PM +0200, David Hildenbrand wrote:
> > > > 
> > > > > So we might have to implement the same page migration as gup does on
> > > > > FOLL_LONGTERM here ... maybe there are more such cases/drivers that actually
> > > > > require that handling when simply taking pages out of the memfd, believing
> > > > > they can hold on to them forever.
> > > > 
> > > > In general I would like to see an interface to FOLL_LONGTERM pin pages
> > > > from a memfd. I would quite happily use that in iommufd as well.
> > > > 
> > > > It solves some problems we have there with fork/exec/etc if the pages
> > > > are not linked to a mm_struct.
> > > 
> > > Afaiu any fd based approach should mean it'll never work with private
> > > memories, while mm-based should be able to work on any kind.  
> > 
> > Is there a significant use case to open a memfd and then use
> > MAP_PRIVATE? Why would anyone want to do that instead of just using
> > normal mmap anonymous memory?
> 
> I remember David Hildenbrand somewhere mentioned the use case where one
> wants to snapshot a VM RAM into a file, then start multiple instances by
> loading that VM RAM with MAP_PRIVATE, so it clones a bunch of snapshoted VM
> running with a single RAM file shared as a template.  Not a generic use
> case, I guess.

A file I can see, but a file is not a memfd, we are talking
specifically about memfd, aren't we?

> My question applies not only memfd but also in general - qemu by default
> doesn't use memfd afaict, so it boils down to e.g. whether you'll target
> the iommufd project to work in that case, where qemu uses anonymous
> memory.

I think this may change, as I understand it, the approach for
confidential compute is to put the guest memory in a memfd...

> Privately mapped file memory is only one of those kinds.

I think memfd and related shmem-like objects are a reasonable target. We
already know we should not FOLL_LONGTERM pin file backed pages.

Jason
