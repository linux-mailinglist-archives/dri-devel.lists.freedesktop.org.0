Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NsqASyNfGnyNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:51:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C4B98CF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CE710E9AB;
	Fri, 30 Jan 2026 10:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gmvZUbG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D724610E9AF;
 Fri, 30 Jan 2026 10:51:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byBGQhhTCyLkYIw9CeUmjLCT5RumIh94Ql6Vs/k798O42JJro5h/Y7p2MiPUL63ukSDg9movunBbMXX/9yNB0hC7jpAhccpRwce0STJRNnwt9K8L1a6rQ8VZs41ZlQ6RzhWVnoq5EQbaajE5/Ewzq2Xwo7XplSeIt1L0jcrO76M0z+1lneo0eBcoyErEZEdk1bl31dU9peR0qhHkQodIblZr/RgR1JDeWiF46zYxrJq+5GPrXri4hLl8YJNxQeSTFINkY/UzWqTfD7sHxXm1rx5W77Um9jiD/0p3DTJfwyJpLg5B7zOKPDvsa+uCKhIz6RC0tPLSPKr4Ad1i2K09pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
 b=eGYesxGVE7Z4UEF6KXfK60XqsuyyN1gols0BIwhWHht3o7iOWmE5TCVrhfPP3cVus6mDga0Oznbzo/JcCJRTzgJffxiozOb4tfkdbTzmtg3Pf8wV+rEHeS1can3jB6pTBjcbteqb694wwe+3g1cPbW4HKBKt/E3i2ijzZWAQe3EAf5lvnYZNlvBy0XhBfUkgynUmN534Sk5QwvPnOp5MLdDIcZLNs8V9yHQrhekQuZ0um4JslEPWzXzgX7mZv493RGnB7WauGVVbOt+0Q3S8emx//ON4Des1Vx37OmQd99k5o6Z8IrQjvtJEHRuIL+H8Wp6JBbOzqE6EPXOAkWum2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDBWE6/St7qj4ff/J/FUPD4WDbdSsilSRHHU81V58eY=;
 b=gmvZUbG13g8DX/uM4S51oWsy3/6gF6T2SWKqNV+fTucvrYXCKQ8B/k1hqdacoLBn7tuhhe8qBAfk6IIjAcHgjgV3AhNjCIsJ4xdxyQqzwKMcUbniZQOAtqxuHl0wFj2dl4jvZXi5HYS/zuFZD60VxEulPdNBbHmDVZ4aYmC/h+k9nrWCKDv6SH9dlH38TupkYnNEZT+DMExIM008FEWtAYZXYX0JWC9Mkqv6TI0Y0PsoB746rqwFrnme2uN9pl2kOxMoDQwq/Mo9r/HlPmyhu7GdF0jPplTP/GlCX+w0IoXvuqm2f1XMSpzlt7Yf/8m0KfH5+LNSz2DQRHJjBLgpiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 10:51:13 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 10:51:13 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com, jniethe@nvidia.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au
Subject: [PATCH v4 03/13] mm/migrate_device: Make migrate_device_{pfns,
 range}() take mpfns
Date: Fri, 30 Jan 2026 21:50:49 +1100
Message-Id: <20260130105059.51841-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130105059.51841-1-jniethe@nvidia.com>
References: <20260130105059.51841-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:40::25) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 801c15f2-9165-4b9f-0653-08de5fed7c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZXNbM93DiNeW4JGOLEDCheiua4yGVTulzBjbXH4IQduls4R6Fd8pFkwQ7nhL?=
 =?us-ascii?Q?v+6yWwWEScIrn7WLujNS/P4Nj9UMqgioVHgKigSIbN0QikJLrqxM4AApK/Hm?=
 =?us-ascii?Q?xqWqjga+RU/bXr3ufz9KaXgZLxMZCF+1WkJ8W2sdCan491erQeyt7kNqVejz?=
 =?us-ascii?Q?Pjs2oPTxJ753vr1lROMF7d30j89AULgXeGkkVP7Xh6FCRDxPUGdvvwqjidAZ?=
 =?us-ascii?Q?wN7aqAgnNlArjm7eUwInACN3oiBxMu5Bvii8KkG4FdOWp3Kzkf+htthplBoH?=
 =?us-ascii?Q?WnYSeQO5Px1h9mLGzesB4xzO5DEEw1PzekmioEDRJz4VsStjfhOnu6LxHkXy?=
 =?us-ascii?Q?CTP6E8xInO9OXDWP4HKI7HkwQHndo9pIOhUQ2ivQeWgIRofxwY6jZf4Q7S8q?=
 =?us-ascii?Q?ZMRfWc0JYhDIfKn6uBY6Qp0yI78Ia/3go4bbWmuqkQGGNVExHBEr6DBsQviS?=
 =?us-ascii?Q?MEkINq2H7fpmdrBfXe5XA6029ay3BRTtZkGZNLxFtPX6SucKd93ShVNIX5+4?=
 =?us-ascii?Q?mkJz8Hw3RZ+XngSNte1s2mtR7Hu1/Onrx0jeWeVpd7b5LGmztiJ7uwURWwiH?=
 =?us-ascii?Q?82DXwVmAeW4Fe93mmu10lV0BFEduCtvzHnplo2eUd+o8EtHSTjg9YqaywuzA?=
 =?us-ascii?Q?HZRjl5PMBRGYRfzq3OJyY5UyZHa75rpybVCNeP3oNoZNoXs0dGW9wAPpamHu?=
 =?us-ascii?Q?egCIAldzb8CbjHIZaIPciXHQ9gGxDiEvLGAH5x2/JmDLz/Xg3I86E1imQtiI?=
 =?us-ascii?Q?dN/knSQ5Hwkx0V8Y22RVZ6JaAdxHtmiBtm6R+j6nRtPHVDo9EmJD7dY5qgNr?=
 =?us-ascii?Q?tz/ZaRmPSx06a1ZaTyB1J5ep2Wt3S4urKTuh7Y5y7RuZIbHWBVF5RGlI0ou5?=
 =?us-ascii?Q?J9RwBmBu1ZENSGwFea2KH694l8pQU+gUaC/+OSNW1tGrw/nFtW8WRQZ40xdm?=
 =?us-ascii?Q?laD0Y2UZ5hRZalh4fwEwlkZ6nekZZCteXUNmpfR2ffsf41Hqu3NDUooHXyxG?=
 =?us-ascii?Q?hx/Fsh04GA1C9QQXnH5tCDk2Az/QKI8DKwtN5z8sZb+PiAIMMkSNUHC4M3ep?=
 =?us-ascii?Q?6AJ5coI2YFXv3rvqwXse5xbElpiaWk7/87hfFRy3Y6b2SLlUpPAh7nVEpYoC?=
 =?us-ascii?Q?jSNDAGaAqOfpQhU/AXcsWLXNCnL7BA1dnUJbYmPo2ok/5rcJZqxtgsUWUT3N?=
 =?us-ascii?Q?IhAYzAGrkv9uMUpz91prDnHn7C21fdq2fbJats0286UN6v3vuhDCHUf2odeA?=
 =?us-ascii?Q?tmZm2X2dCv6g+z79fg/acoRqSVdOOEkfs8r/ztJVMV8Kbyy37s8SivjA3H6T?=
 =?us-ascii?Q?0/zocMs2DYBI/L3jJTCNsrAa/ih1biQ0N2Ji087wvqjwBxoDZpsZ+barRUbL?=
 =?us-ascii?Q?j8oDQ7EfLxPGUgGD6OP8TCZiE1fF2z/vUtY6+BbjRVDFocYOAHAk89GdnuUt?=
 =?us-ascii?Q?zhxmcgtJJKdLTXCIXgR4LjjHc+YvzFNZnUDdLM24M2/SvtvBoqovskVGlEM1?=
 =?us-ascii?Q?mxjXSybsLWZHJB0E0CKNa4XgH31xActM93dchDWgRUvMK74WCqLLYiKCXPIu?=
 =?us-ascii?Q?fHn+aG6SlDdcyVkAtv0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DFKpIgMR/9hA5jOzgiCUge1Pop91DSZv73SZb40zA+EzKqCPRIrtPwGai5Ei?=
 =?us-ascii?Q?XTtT4SUafgL0IIMCQKDt69tdvdGJ0eJViB83bMMC6BTEmIxtb2C3lk12+4ak?=
 =?us-ascii?Q?91YCUjCSG8eE4xWz5uCMFe+hLmnUeGFSojXR2m+GNQbB23xtVVCoQbKaNUKf?=
 =?us-ascii?Q?nIeU4SmWB6dJ4DbgfZ9Ic/QguwqJRtTYEWF+ErJgSpB6IKmlbm1pjQGrWE33?=
 =?us-ascii?Q?JvPmg15z8TXVLxU5WTEaLMF44yMNK8/0CYAm0TMXvjoJpo9sBhEGTYdoP4zG?=
 =?us-ascii?Q?DHoPpbOTLY3VTRfhGS9xIY8hr6RuU9lq0LH24gWPUt/KSWHe37YKkbpQT5d8?=
 =?us-ascii?Q?KHaIUHQIVs+bjRnA5QNk/AH0NQOJ4L3fXwrUpWxdui42H9mfv3j93bA3wAoz?=
 =?us-ascii?Q?b1GtGNjBuO0cxocWPZWvn0THWlImfn7cNTLGZ1DwiLsvXLZkf//MOeye1gxZ?=
 =?us-ascii?Q?Gw52DevSJ5H9sNRH1eHk9E5xEf372zG9NcEX0vJIxG6pMgrT2LTm47axMjxA?=
 =?us-ascii?Q?AQlC//nlk3c4uLCTSWBlG7Wb/WL31yF6lU/B2OnaSrX15TjthTh4v9CcpKfY?=
 =?us-ascii?Q?a/fhbME51ezNaQhIe0QSyt0aWeUS9zK4aGhMNiO0SoazuF4q2r+rssCe/DN2?=
 =?us-ascii?Q?wwSJ1sanGgAkSaldGON63UZeLzONY4YuPkGW5qZOmtRo8cGvyiwOg2DN1Nyz?=
 =?us-ascii?Q?qI0S+G1um/VsrdOGCIF1lRwlb+ArF8tdOOoPNMV17wDM5nW4pKyWelWHzt2m?=
 =?us-ascii?Q?9P00T8trEqHDMPT+DL3dlYBh+h8tvnQXcd5S2BN7ZXL8Fkl4gvab/nt2PKtE?=
 =?us-ascii?Q?po7IgkCtV6bDyHlzyP71duqbr9vJcy0bDjThUSuEWgrVWfbrmvo7CFdAyyQg?=
 =?us-ascii?Q?MuKN/+HhrrgE9v/qYqe3hxe72W6h7KBdniE4SeHbxxx4CyuZvENYJG/hiant?=
 =?us-ascii?Q?G+1dJ+4SWphxKjxUZlwFosuJ6ImmHLC2HAVMMqxrT8iOmiUo4zx3BA+JdETG?=
 =?us-ascii?Q?tRwFJzyBMMRwEx7fR6wgfPAbnYDe0ZOzdH+Mp4zARinFzLFfI/hoYLaEfwJ5?=
 =?us-ascii?Q?aPPvjj1hktTTwR4p7Yu97q1OaQKCOQuuv1EUiYD7uNT/H3tAD3TyIoVddnO0?=
 =?us-ascii?Q?8xoJ5W559qQSqG/4RbFmgSKh/Yk4Zb1FHD/+PMCMsPDcglGuNA0GQlu6ViGT?=
 =?us-ascii?Q?Tca1OOaYYi5Oqedx2mNeU8JmfVCvmvARzn1TydpGZCMp/jgL9XyPu28yftBC?=
 =?us-ascii?Q?8dkEkJQcfy/kbdbYiwhgGaaPFzF7eVHj8E2t3KbfXIS2sChqufDX4BAzmLQz?=
 =?us-ascii?Q?Tfetum177VmP25Q72h3r4g3A69sD2+p9TzE66DJKkX4bczuZh2SoQYQHHGl4?=
 =?us-ascii?Q?iXYyXfCz897h7etiklX9QTUCAKpFIQo4egq08Sdi7clobEyB0CbGYZRWHfyz?=
 =?us-ascii?Q?p4uAV2gxka/Hh/ZgNcyzoudQQIvyEN55dTdvxAyxvfzJ5YbJU+FzpTDMgdoA?=
 =?us-ascii?Q?+zwUuMQPoCVsfW1znqXicXxFUq5G3vAXlBGXcw7fAsrgNZSx0WIdZNq/KyCZ?=
 =?us-ascii?Q?ZXqJUgjUmyEmJuCo0RM7jukHC4g0cW4aNE5m2zoubttixpJfADrpVjBCEP2z?=
 =?us-ascii?Q?sr7Ir0rok1NLUUWgzkSXiBM/UiBzAqNp5NH1YnB9jgEM+Mzgi3UoT/KiXU/8?=
 =?us-ascii?Q?WWBDMkx2Cd/xmFB038H34g/HCeDsSKUOE2KbC/+I70TMt++C3tYmAxPKdILF?=
 =?us-ascii?Q?8DGDiVCk9g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 801c15f2-9165-4b9f-0653-08de5fed7c60
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 10:51:13.3163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srS3oRACQu6BCUNfyCxOtHjRrnanSblfY3q7v0b249r3pFt/VqLEguvh1hbWb7DzfY5qEdb8eAlauvrNCqj/kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nvidia.com : SPF not aligned (relaxed),reject];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[Nvidia.com:s=selector2];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:-];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A75C4B98CF
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

This causes an issue for migrate_device_{pfns,range}() which take pfn
parameters. Depending on if the device is MEMORY_DEVICE_PRIVATE or
MEMORY_DEVICE_COHERENT will effect how that parameter should be
interpreted.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory, we will take
advantage of that here.

Update migrate_device_{pfns,range}() to take a mpfn instead of pfn.

Update the users of migrate_device_{pfns,range}() to pass in an mpfn.

To support this change, update
dpagemap_devmem_ops::populate_devmem_pfn() to instead return mpfns and
rename accordingly.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index 526105aa4b05..13072c8665b9 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -505,7 +505,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -590,14 +590,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_aborted_migration;
 
 	own_pages = 0;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
 
@@ -624,7 +624,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			cur.device = dpagemap->drm->dev;
 			pages[i] = page;
 		}
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
@@ -979,7 +978,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	pagemap_addr = buf + (2 * sizeof(*src) * npages);
 	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, src);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a7edcdca9701..bd3f7102c3f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -483,8 +483,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
-			npages);
+	migrate_device_range(src_pfns,
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     npages);
 
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..fbf5fd284616 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -10,6 +10,7 @@
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
 
+#include <linux/migrate.h>
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
@@ -752,8 +753,8 @@ static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 	return &vram->ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
-				      unsigned long npages, unsigned long *pfn)
+static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocation,
+				       unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
@@ -769,7 +770,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = block_pfn + i;
+			pfn[j++] = migrate_pfn(block_pfn + i);
 	}
 
 	return 0;
@@ -777,7 +778,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
-	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.populate_devmem_mpfn = xe_svm_populate_devmem_mpfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..bffc7fd5bef3 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -192,17 +192,17 @@ struct drm_pagemap_devmem_ops {
 	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
 
 	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @populate_devmem_mpfn: Populate device memory PFN (required for migration)
 	 * @devmem_allocation: device memory allocation
 	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
+	 * @mpfn: Array of migrate page frame numbers to populate
 	 *
 	 * Populate device memory page frame numbers (PFN).
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
+	int (*populate_devmem_mpfn)(struct drm_pagemap_devmem *devmem_allocation,
+				    unsigned long npages, unsigned long *pfn);
 
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 7e5248404d00..a6ff292596f3 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1389,7 +1389,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, start_pfn, npages);
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1a2067f830da..a2baaa2a81f9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1354,11 +1354,11 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long mpfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(migrate_pfn_to_page(mpfn));
 	if (!folio)
 		return 0;
 
@@ -1367,13 +1367,14 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return mpfn | MIGRATE_PFN_MIGRATE;
 }
 
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
- * @src_pfns: array large enough to hold migrating source device private pfns.
- * @start: starting pfn in the range to migrate.
+ * @src_mpfns: array large enough to hold migrating source device private
+ * migrate pfns.
+ * @start: starting migrate pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
  * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
@@ -1389,28 +1390,29 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
  */
-int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, j, mpfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
+	for (mpfn = start, i = 0; i < npages; i++) {
+		struct page *page = migrate_pfn_to_page(mpfn);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		src_mpfns[i] = migrate_device_pfn_lock(mpfn);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
-			pfn += j - 1;
+			mpfn += (j - 1) << MIGRATE_PFN_SHIFT;
 		}
+		mpfn += 1 << MIGRATE_PFN_SHIFT;
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
@@ -1418,32 +1420,33 @@ EXPORT_SYMBOL(migrate_device_range);
 
 /**
  * migrate_device_pfns() - migrate device private pfns to normal memory.
- * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @src_mpfns: pre-popluated array of source device private migrate pfns to
+ * migrate.
  * @npages: number of pages to migrate.
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-popluated
  * array of device pages to migrate.
  */
-int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+int migrate_device_pfns(unsigned long *src_mpfns, unsigned long npages)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_mpfns[i]);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		src_mpfns[i] = migrate_device_pfn_lock(src_mpfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
 		}
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
-- 
2.34.1

