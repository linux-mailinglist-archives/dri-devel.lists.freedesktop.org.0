Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF2E7606C7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 05:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55B3D88647;
	Tue, 25 Jul 2023 03:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0910E178
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 03:40:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBBWDlo/zYOTCJ/ypRIdLYxllVqfi8vyiQgfqIOiKU6Y1beiENHW00J71+Y0s1fE0BcKADivAFfaW7Eglj9A7lmgsxSmLIgOyZTyXKOEF6wFlRT/kzFmBFTWf5gSwUFI4qC/efysuwtrmS0msUDgqgrv4QXFeuNSHaGvOsY9CkhrIEs3NeoJRkYuzcHbOAtOTBQ1zFzaishDwgUH8i/EoTWk9xxkm0b4TpHuJdlNUkW6s7BaKxd40rC2LLR+jlRIHmhZWP7EeJTJdfScz2TaeCTL0ilieHRU4sYb8F9xmYEo7WpyjUoY3ERKXBR0mWn9qdFbEvWzOEs1l9YI8rac6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIF9AwXsigwkRwJvACzoYo6rOW3skpq4+u4L37JdyNA=;
 b=U4gUGFHczxgDjl+72foMwQc7LDDItQfZziMg4ofzN5uJHA0nIEREloEgncZJgE7x4G46sZEVwEJzbJ1uFKsejyXqnCZADt2rmuJiaGttcN3cF3+9BFaVrRfdxNQod0hAEkZRx3/4IvKWlTZIgXcY64/Hwu/7vY6KrdMxkyMog0BE0YtaDdQae+ySPmxgq2VuwJiYktEBoW5pYeLRCI9nO64Jl4SIf+15RnH/yyizrhp9sKrlNJhatPP0VU7amj1KVmiNa76vWii6c/a2nW0q87oadoegVVhrP0TF2zWQU3t5v04IQqSNlSvSQIBX3Q+cMPG/f7DJ+fgqRuRFTicg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIF9AwXsigwkRwJvACzoYo6rOW3skpq4+u4L37JdyNA=;
 b=twt3qBjRlG6ORGZWdLlIZjhs7+qhzp7Rkht+54C57ahTPsHjkalHovBPGtXmj0Rz/sVg5Ny9FRTKlIl9UZC7qMxp2M7spmIhEtnJmhFeAAJy2gPPvELh6HmdVDtlbZdTDHxKMKDcy9YlXYgGBNtIC725xMh4mDjAjUdcLsvwsoBC0mUXmO+JoK14Ja0aC9q0glSvog74XzLR+mkrj/QX4YKD0WsSiBXxe76wwui3KJ0W3wLKk5q6adkf95MzwMcC8Xa6mARxIH8qIcI5++s2zf+qjyOuMa33Rwpu1MoUpTMdArs1/EICUI1MlZx2ThIa3hxVX5qDGrwf3/br9T+nYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 03:39:58 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::c833:9a5c:258e:3351%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 03:39:57 +0000
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Tue, 25 Jul 2023 13:38:08 +1000
In-reply-to: <ZL5+CiZ6w4RdAt5u@nvidia.com>
Message-ID: <87a5vkzmk8.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0094.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::12) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|BL1PR12MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f3576e9-5dc6-49f3-c1d2-08db8cc0d0e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnsZTvqk28LYvwbXEaDdw7Furl8NWRqQJTCVMwok0J4H2ensS8qvpgwW3w1rQ6A1mNu9/LO8NOmubFhqTpbEFrt1dOeQE/ugjNsiHPkBoVm3F5aodhTfSJcH4dwExGcA1deu9v6MwkxhcSQDvDXEKonUBm9PnW4ZFj4U+HUYaVRSxl7khuL/GL5KBKda4KeNXx3QoYRECkAhCEw7v+ioSVPuJ4quYJWdmXmsBQO9EeKi30XnNxCWCAzDGwQLw/xrNt0Smf4uSvwRefC2tsaUjz9tX/ACvalH7H9GjHgR/pEME4FDeuABygk7vDEeho/gU6JbG0HzV4P3cEpqx+KQ6SRit177a4UNmjItUcjRFX+m8XzwiHwbFenimulQ/xsMHW8H1xD70skYPVaw4MAoKCbrJ1c5lBOA3R+KVjCYNwXeJugUU3fqq9q27V5EvIbSDZbxILOmMAzZyAKiBfWebRDNSxe1JyRM0kGXqbwFv3McbMkJ7+A7ZhBCuppuU/75SkyB+OHoY5Oo/0s8nlZLaMcOMLle6Im7CyGQeok0UDY6lyh8aKWR15Adf7M38lyh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(5660300002)(7416002)(8676002)(8936002)(6862004)(6636002)(4326008)(66476007)(66946007)(66556008)(316002)(41300700001)(2906002)(6486002)(4744005)(9686003)(6666004)(6512007)(6506007)(26005)(186003)(83380400001)(478600001)(54906003)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2aMB5W7eJYyx7BmFWo1BDiD9xTVBc5QwOVuAc4fcUCBvwSCjE9hyHEdKeBj?=
 =?us-ascii?Q?nZ+tSV2KUbdJ2XwRK+ivuOotuXoiJxI7PlWgebvfAbgytUt571kvUX1PJlFf?=
 =?us-ascii?Q?DdwsXsMYfP5ApX1fTlRpZLmgMSPtjLZGiNjH5pm3GMOy/nSZ+11JXqtkYMUQ?=
 =?us-ascii?Q?MHwqEFKzKRDtkHlHZY2K+NkIpjX9SFT37NGo7k6kXu7VEtjLsfDne2o7w2TT?=
 =?us-ascii?Q?70DIaRfRW7YHjch6ndT6xn9RmdGcqFyb6k7eGe1v/5FpQ2OcfBZAo0ccZNIQ?=
 =?us-ascii?Q?YeYbNOqOkvG8GQRvskw3ZlCpkqnin8ZXTYXSrzG8h7HQ4Z+PjHkuwbQGBHif?=
 =?us-ascii?Q?BAvp0rg8V+44AW1cuf8373BvPonYJsVYDl9oI3ZgIU3FkGxk/2a2Bh5THL8I?=
 =?us-ascii?Q?87hpn61Q2+7sZbyWjY+jNwqK3l4LoYCvLNcnUPyFDi7gbrwqS66RPqv2AY3W?=
 =?us-ascii?Q?GSJXtQCiDfh6RU8DgeJfIWfgxG5GK8JbqPNHvIFBe8PvS25FZQH9S7e3Re6g?=
 =?us-ascii?Q?S/6rq42q8EzJ11R7eBGXdBzJBeWBmAxn/woKMroPc11ki3peGFnY9Q1FzRZ9?=
 =?us-ascii?Q?t9NKKyOnltJJzHGA76S5GsguMYigCJNpiCEC9Dyl7W8z/8VC5V8nD4I9nCH6?=
 =?us-ascii?Q?beGvGOBXPVJn4uC62LZWx3Rzk8f7I6/LBjx8e21jxscw17Wkp7T6WWMv/L8t?=
 =?us-ascii?Q?ylFSauSa5sCZaNlTwFRwAeVEwk7592VAGoHG2jxJqP0pteucs2juIObndCtV?=
 =?us-ascii?Q?G+SjKcLtvLJzyhm6RVM6WpCdL9WOM2eh5/BjAW5smfdTN0X40pCb4MY8di7S?=
 =?us-ascii?Q?sPrWagwu3IgqpgcewwedyymOKH2L/RHa4erw53g2945LZ77tarv0nFvo6KFs?=
 =?us-ascii?Q?j/bUBoGjIhabjzbutDpnMCDQ3xhAxKOPEUreal0L+itI1bbW/Y8hZSUPYxBn?=
 =?us-ascii?Q?rdCRm9K8JwKTrfZk/n/7/n4Mlg4pWwi1ZU0CspM3Nlug55M0eCzl31V5Z/ak?=
 =?us-ascii?Q?MxsylmiS0tqdamRk+CzcuZXFsa3jS1O8nfKXUDLJON6+fjLZFR9kIbxIaR6+?=
 =?us-ascii?Q?QCg3AIqtxF+fvxa6xooxifb93apPVqJvnVogKCw01tZYhDLZzSPvTQv21REY?=
 =?us-ascii?Q?MSmHpywZT/DjUXChppm7wEA8hZpJQYu8auy4png5NahU8rM8F4og1meNPIYD?=
 =?us-ascii?Q?RbadgxIU+uoiJq3/4AvzBiA2wUQ1rrhu6jrdKgbqQaICbpjmCo4/XxQ4/crY?=
 =?us-ascii?Q?OW95zz+tg1rbGDcsnTujCK/nsZhyRTHHf0yidaqUCXwFpbBJ+Ng3eSgYm6Vb?=
 =?us-ascii?Q?/XI420S41F1XfBZ1VL017/tvgU5R0pS+jnEX52HbbOLNBZk0LDJIDbwjst/T?=
 =?us-ascii?Q?j3z1jSGwspKElj4FC7ddjDcRBpCs8VW/OX93S4U260H7Q0QG1zuiL/+gIVnx?=
 =?us-ascii?Q?ctH5LLTxTD1Z8vyaFy9g5nDveQ8E7vAy5VRoBIsUX8OLLR4YgtJAE9pdvhAB?=
 =?us-ascii?Q?LI6GoG7PvqjWr5kirkeEsFiTs55Ej1u+5yWXdYfoYSAl0Yk4MtsoKHQwsr5m?=
 =?us-ascii?Q?L5TY4cbh6h2vxE9rlhlqVRHlQpogJ4wgWHwGp6Zq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3576e9-5dc6-49f3-c1d2-08db8cc0d0e1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 03:39:57.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WHsGM9xgRIn7WWOLbQ7kT/pKNgVf6i71DSc8wnAxc6Kb6tWssh61ja/9aUkRFaRz//NmwL+bFJ1oLmMtdM3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hugh Dickins <hughd@google.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Jason Gunthorpe <jgg@nvidia.com> writes:

> On Mon, Jul 24, 2023 at 07:54:38AM +0000, Kasireddy, Vivek wrote:

>> And replace mmu_notifier_update_mapping(vma->vm_mm, address, pte_pfn(*ptep))
>> in the current patch with
>> mmu_notifier_change_pte(vma->vm_mm, address, ptep, false));
>
> It isn't very useful because nothing can do anything meaningful under
> the PTLs. Can't allocate memory for instance.

Yeah, although you already have to be pretty careful allocating memory
from a notifier while holding any lock as it may trigger direct reclaim
which can call the same notifier leading to a recursive lock.

A totally different discussion though.

> JAson

