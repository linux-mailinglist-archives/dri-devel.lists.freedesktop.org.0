Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DD6CEF9A4
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 01:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A80A10E2FE;
	Sat,  3 Jan 2026 00:51:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r7N9WLNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012047.outbound.protection.outlook.com
 [40.93.195.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B2E10E2FC;
 Sat,  3 Jan 2026 00:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9PFPLTw4SWtKGTsyB0ZWrMoaEt+gmKM5gj65bqiO1+347hmSuWNzuAqOTwfUswncjsk5XFRnmrGqlLvn6bcXpY3ZMiWjBcTFEfpkRAXBNTxXFouxi01CYRGxnSVI4IoHtHOKJgajBvjA1FCNMCH8Pt5Ha3tH5VIgR4hQILL8WDNVFHhNXxlqRdnryJkO2AT0f/U1ZQBQfBsVBvURJF9u6s54l5+9nzlgKRKQz7TqoRABnB0T5zJ3Z7KVaX8ZIBypU0K3GAlEiRSR72t+4RlPmv+XUrqr7opEtS4A5CUEZgFD2hsnBkFkd6sKs5F09CGtBpkebe92MA5bKNUyr6TZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yxq+MHMFw4APyzja8hu1mgjpWQ/mABLK0XY8rQMDz1k=;
 b=EfTBv5AfC2CcAElopIcSbOculDp4e9DgaKO5JsJIU0QWuUUDVn3GkWVRBHNDTP1NZiPXXPGaZj5G2hcmIloV55wSHLjmOqjdL+qGFRdgT9A5m+J3LWCA5UNzHeEkjL+sAyU//fdF7mN48AFAI4oze8+giG0RZq+D6rSR7I9h3TRkQZ2o4YjHYY+MVRsWhOKy+ESBTkwcwGYfLanMAdPDLAjPeF2tSteLEcs/fo0hwznqN0kj43gHA3Kiu/x3MQPQr0tZ7iwXF0T76FphyCza6tgbE0O1K4nKfWUc+PiYK7hd7lQMMnXBj93BP6Oj5i9sGcpnF1RfC8vfQx0AuuCciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yxq+MHMFw4APyzja8hu1mgjpWQ/mABLK0XY8rQMDz1k=;
 b=r7N9WLNiko9kuKu+2WIP1upIGVyXlGA/it0Lr70IAnbJ0NeO1xmbs1+l0rehwlTAjBQ3SM7o4VOKxsMHTBjxFGs9MpXLBSheGdhh6f0A0D/WAEY+ubPkeoMYMkJEA9fqHyMosfpJMuHiRv67HbwbgRp7ZjkKOXHN2TtA2pDFdItiUkqMsBvmILIzA+Jgr/D0vYsDOHAvRd/xSeqNtm1gTYyQRLdeHSZFHRLjxdAiwQJUxIHRzK9f+Qkx/Xhzy14KE0yjjrUcBYARbxNyxEboV4j5ZKA+rYq6Yqo68UaJXGh6aSzcJ2rjL3c0aUXxGQfrveDUkVdBdGpLrUD6suad6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 00:51:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 00:51:01 +0000
Date: Fri, 2 Jan 2026 19:50:59 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <20260103005059.GA11015@joelbox2>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229111748.3ba66311@gandalf.local.home>
X-ClientProxiedBy: MN2PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:208:fc::21) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a45e441-3da7-4504-06d8-08de4a622a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dsDv/L5uxfnBOoB0EqkVKcPZFK8R/R0QEfCJAqs5rhPTbzD0Kux6kK8Yyqgc?=
 =?us-ascii?Q?UZh5nnQceV3jq/xNN/wAmvjlfC9IA+fu5eak2EPL8aJvnjvQiuFFqQkTlW8x?=
 =?us-ascii?Q?fDSUiieckM91nBTwQGVTEUXsxSTBEZvnPYnhp6ir1VtTP+mode0MM/lyDbl8?=
 =?us-ascii?Q?YsHQ/zPTX1ovpfKnwBMTDLS47nDZMo9hnyjZUYyPTGPoynCA8P8MNhiLymgR?=
 =?us-ascii?Q?3blUEf3ZLGUpJEbIFDj0H9TaDMd5uoMeeVlUPBvj9YA8x6TJBcD6Ic5MT1kv?=
 =?us-ascii?Q?gst9Zp70PPBJ3MKshJqzlkYiEOhc02ojrrSUbD0b4IxI2vjSEnbLw1Ke0/4i?=
 =?us-ascii?Q?yQOVgYOBWmcCIP7WgSUyHXwTPz7OvKasglvvMAzAmgicSMtPnWZohejN2MOo?=
 =?us-ascii?Q?NL3m5ufOQju2pXkjsBrfb6i6L1DhnDyyI4bkGU9nw2JHA3qYGdvAvuAP7OCf?=
 =?us-ascii?Q?eod0WX/CaMeEBUU5kexx1LB6Cmb9nLqgUdvvPep/WXuPbYjdfBYnycnb/yCY?=
 =?us-ascii?Q?BwQvIdEZGlNKZ+Zp3A2SlbtpI21Ad0NSt4kkMJFOhpzgMSyMQoXLeatKyFUU?=
 =?us-ascii?Q?3r/Vhc2B7n+F3fuRYo6D5OPTBGNAtphHhhrOY2ipOjlqfyzOXtMD8amEDv75?=
 =?us-ascii?Q?XEa/ESJ3Z+4QDZEjKmEanLtAyGCBMtGcDbtC4WscH8OolDOQW2MYB7gEWeL2?=
 =?us-ascii?Q?H9sWGb2dswHYh2U8ggMemO6CiHKGdqXV8W+DuqD9AFVmB8zVAyDwvTPF1hpa?=
 =?us-ascii?Q?3t9SXHk8AeFQiFtg/fubpxpDsTSDCfc17PyqXQUBOu5gj/Xo8hqbzdvhyJzV?=
 =?us-ascii?Q?hREmS50zr5DA6ZXWj0xvmC1jpikl39mGiY6R3l0RxCmkQehgNm/F99V+tW0v?=
 =?us-ascii?Q?PzJeBn9h6HwWXp/vIIXHTxCSMNpvO5LcEnQkaCyHb8oRnNzJ2Xv6NxV7E972?=
 =?us-ascii?Q?fws61uj1m+gxob8WQvS7nlhMXDg5zlAhgyLQe2je2sM4p5EckAELiDx4EGtv?=
 =?us-ascii?Q?oTHihNmYwNmVi2XAL4yxJ8hfmFamQ3za+AaH/M30ZozwbZGwTfuWweBaV5ZL?=
 =?us-ascii?Q?nhH1EXwWpkq4mI2pQxf4zu3PPqcmwbm5GEPQGzma7G4Se9s/OiidoweJC9qR?=
 =?us-ascii?Q?lpGMFxayvnBWvE3hp8rSc20LgyR7F6JvIBmLP9ghhjJ5Iot3CCXIYMmbf8qj?=
 =?us-ascii?Q?CdZ/mx+1Zb0AhOVwUzYigj+K/19Mkw7zgbgyb5I+JvArRXHkF8Wx9b9P6uAY?=
 =?us-ascii?Q?4iV40FbmSjFzffzHM00he1lMT9ozysToJl172EsFF1TrI6qlhcq+GTewzQWM?=
 =?us-ascii?Q?bnSJkOge35CokBEP0KIonM5ATOvv4+F4s9otmorfj+18ngSudtS6O7moGN2I?=
 =?us-ascii?Q?S9BiX2wJzv72besYtCi8VBlCrzh9WOtJDflU8giZPCQaXzzb2iM+bYp9MvNs?=
 =?us-ascii?Q?GkbnN/m+pkdcoDzraM79oQsDPzdtp3zO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26qmSiQsIeLMJtd1Wjxg5ifOY7cK38Vg/WqZJi7k58vmHF/WJkcrqc9WYXIi?=
 =?us-ascii?Q?0f8M/Xzu83qZpLze/SVZLDu0T57zU3XYswVMPUhDiYz6AGhTEQ+8Vl9hvpeM?=
 =?us-ascii?Q?D5/omRUG1Lr0nGiULtOfD260PVztJw5UNFzs5KqGhzX4ngTApfOh0Oy2C1DJ?=
 =?us-ascii?Q?HLqVCWlrH1p5hGqtFkMl22vN9q0EMnLtEnwAIryOH8UaaemCNsE7wKhRGY5h?=
 =?us-ascii?Q?z/0agOgkvL99L7a9R/T+DbfbO1Iv/zfL4EdT71+3up+w2TTK+Z+fdcclqJua?=
 =?us-ascii?Q?M2oSg7RmsRQU5f1wHE7mdO/RoDtDtIciLLKmnp9tyWCccdxrgVuzRYzrC/T8?=
 =?us-ascii?Q?YbfXyxKtMOJqfWQRxs7vpvVxnw6BMi+N9EDsPkXpczivpnIEaeY7WpY9wr6C?=
 =?us-ascii?Q?8ii/Cn0dQcJb2kUQDcW8t3WSmuGX9GCMkJSKA3UyYgQF02lea1nQZzT0jAQd?=
 =?us-ascii?Q?tJox9n8WZMAtVjwAybTtp86i4Dswbrhu4kGuY2uexOV1Pfbz8iIa0IW1yd8K?=
 =?us-ascii?Q?wxxg093/fT7r/cc/9PLrGwVJZpAn4w+4iqZ3gGaEllGNstMzfKgrAFjpD13M?=
 =?us-ascii?Q?VvzWEmV5DCtAfDqG1SkeTGy7vi+jGqKRLEZQOtDfRsT29WeFTJ43SLCgeMZy?=
 =?us-ascii?Q?nBuXTsnumK+8e1kUjKc6qKOLJ/mmhT5b4ewmZT1J3z4vFGUFjSFGKvRFdnPo?=
 =?us-ascii?Q?jRoRMPRKbRt5qpbHYSS6Q2YWHNpFoYYNK18NUTr0OIotKD69rDiHjnUZ/8iQ?=
 =?us-ascii?Q?rvSpZE1V9fk0qIuiDfcysuey/dGZR0SoyIPvTvaatZKWtlFK1Eb+jsP9vVgV?=
 =?us-ascii?Q?Fwwk8qp/vVC89lElgM5jpK3Yc6GnmT0II+PLGnmov+RMTHOaYFmgwDBGi7bn?=
 =?us-ascii?Q?qVfjv+rXEGP2iY66C1hT40HiQbHmFkPW02bbb0uSzTkM/GQb2tixhu2EX0YQ?=
 =?us-ascii?Q?G7WMt1p7EqhrWh302IdcSQJErswMkNYlX4Kx/JaM3ppsPv/4r0t5rdH8+J5p?=
 =?us-ascii?Q?WV4lhjjk222M8lNjVWPZJapxH44/9vqInd97eVEri64d6XDXl4XfUR7r7iRn?=
 =?us-ascii?Q?8a3pY29ot867Pyr1TAFTZwlJDkOhoZMruRpTYfzSl2hQjYqdNkB5fp6EZnx2?=
 =?us-ascii?Q?LfMU4l+ZlP8SV25ROUENdV4AWL+4/kvY4RjJP0BbnMeaQPlr5tFJgVy76zG6?=
 =?us-ascii?Q?bgOGx5R7Kb7Z0DuO+itg/MC9RXqclCQB1yNRUQAASPC+gJIIqbfrY9M83xQD?=
 =?us-ascii?Q?DB0JgTHN2DZTJrOfKv/0oJL5NM++pMp+GcE5uHDD4Rr84cxM4TyG0JlxoH/2?=
 =?us-ascii?Q?n2t2X95nkvLqyS9gx3coZhlKdBWsDjrxpqSjA1JE1H4XHN+6ntz9IZKlZhB2?=
 =?us-ascii?Q?BtxFuWeEcXknHJnsvfCJyGKa/6H4QbWWbfloOSuJ26UBAfNWvP9sJlQEQ/Vw?=
 =?us-ascii?Q?5s8FQTPdk8s9rBtKSql3NSWGyBbqNlbZLMbAbFbm/cN6ggjVjuYCWC7KnrhI?=
 =?us-ascii?Q?7qJvxy7/4gYtCv+r1GnEuPFFSrUhLgo9qGsHFG7tPpE/A+oNk+7G5MLCUkOq?=
 =?us-ascii?Q?dczrfAn88NFeQ9uiIs5k6oKf0UtUmoCM7JBf6uuBz32OVtL6D/Cdl0tLcneo?=
 =?us-ascii?Q?tFKKVQwwFWEaCb00IYD045le7YnfBp2VDkj8UbZ0RdFsodQHMDSx7sEMUFSw?=
 =?us-ascii?Q?lg/yBiVFsI9WAUC+smS8CwnrXcfE7R6jg13oal2VZhjdZvV06IFMC6y3jvFI?=
 =?us-ascii?Q?FzG/avirqw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a45e441-3da7-4504-06d8-08de4a622a87
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 00:51:01.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqCi8ZRoQtGGPvDN+haozGZ93C/q3Z9tR+ywx93BM0lMlbFPLFHGIEhn/YcFQux/iX8D5J0pJgaXPlHs+axmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454
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

On Mon, Dec 29, 2025 at 11:17:48AM -0500, Steven Rostedt wrote:
> On Sun, 28 Dec 2025 13:31:50 -0800
> Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > > trace_printk() should be as available to the kernel as printk() is.  
> > 
> > um, why?  trace_printk is used 1% as often as is printk.  Seems
> > reasonable to include a header file to access such a rarely-used(!) and
> > specialized thing?
> 
> It will waste a lot of kernel developers time. Go to conferences and talk
> with developers. trace_printk() is now one of the most common ways to debug
> your code. Having to add "#include <linux/trace_printk.h>" in every file
> that you use trace_printk() (and after your build fails because you forgot
> to include that file **WILL** slow down kernel debugging for hundreds of
> developers! It *is* used more than printk() for debugging today. Because
> it's fast and can be used in any context (NMI, interrupt handlers, etc).
> 
> But sure, if you want to save the few minutes that is added to "make
> allyesconfig" by sacrificing minutes of kernel developer's time. Go ahead
> and make this change.
> 
> I don't know how much you debug and develop today, but lots of people I
> talk to at conferences thank me for trace_printk() because it makes
> debugging their code so much easier.
> 
> The "shotgun" approach is very common. That is, you add:
> 
> 	trace_printk("%s:%d\n", __func__, __LINE__);
> 
> all over your code to find out where things are going wrong. With the
> persistent ring buffer, you can even extract that information after a
> crash and reboot.

I use trace_printk() all the time for kernel, particularly RCU development.
One of the key usecases I have is dumping traces on panic (with panic on warn
and stop tracing on warn enabled). This is extremely useful since I can add
custom tracing and dump traces when rare conditions occur. I fixed several
bugs with this technique.

I also recommend keeping it convenient to use.

thanks,

 - Joel

