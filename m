Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ+RC2+MgGnO9wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:37:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DBCBC24
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDEA10E47E;
	Mon,  2 Feb 2026 11:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PD7VZQ2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F94310E479;
 Mon,  2 Feb 2026 11:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOjF2lkLfCR4MWGujWlk+JTtNmpm0Kzs1ABjW4yhLTF77BW8iKxkNU0J4Q52XAsyccGkZ2ZX7p8PaGjI89u3r8a6R6WCYEWVii1UKRqasmvb0KVkOj83MN46O2qIJLY5AtS7OqRusyfc2Z7fBCIHT/KoLPhANDdVDg/wRGLGx1WKg+jtgJ50T5+9kxSs0qRn4/aNcTWWhR9/ARb5gI+2Zh+Q/fSL7Vq14IGisWmxfiu0WEWph5482Ac9M4vRn/KzxW8qJ0+gPUjmbvv7rJkuD1L5Pcp6UCGmP7RnR+FdViIOhTNzP8hLqlOW5wCuhoW9fO0CyvPSqv0dhrZFN86j+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
 b=C24+ujDX5LRCyHzttYYwnhlYJ/EhrHtWgEcfMbL2NJUWITleWid3SoIMwdvbkTD0We1icnVRpyuFlB75Qt5wKpPovrQNNZE37yhP5RIw9kcEqIuxZBJ5EKBxtudF4Xp+HKWy8EO+s49cxO5o5CoV63U3TwPsz2qdCwTULeFEw+v77Yq8Kawy2a1yWT/BtPfTctT0JX3NLM0pLeJ2fZIZ4SFchw9W415BAS4FjVVaUYchh1cMGXdcX3WWAmgYDCuBgHhjpT381qObFk+bnjGjCZ/DOpkB/sKkCh9crldzmMlqFgN9ye93VH49T9J05nvg7fEtBAmDErWrUI2ZUPoQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ryEkM0R0UgEq3cYLafI7G0UmhxmDw/OoeGOVdZpwls=;
 b=PD7VZQ2l93DmDvh/kZ4ge75I000oPjZJ0zbhTt6UWQdyulpTvvsCFjeINiYEGVkSekLF7C76YIAdCZH6w4NXP77z4eOR8p9QjbAWytdwau+MXbVZ78N10vxq4Yn7vVsVHGH1yNLh2ZHxzqv8yFLvKgRIHssMbRywLG/cckgUmDY5VKSptFfIUo3BixD45snexBrE5v+BR1AbWKnSZ82366Tnk7cFxlEqXCez1q6Yaf1eGlqCJvoHjMUyvGs0cfwfpVdqIFenDWvX6V9COAr1ws/U/HF0Qv9r7FRVrv4PhaE+J0rgzOdDK2QeH5q0JEy+zjtI+FIV67zd2BlbIYiuIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:10 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:10 +0000
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
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 ying.huang@linux.alibaba.com
Subject: [PATCH v6 07/13] mm: Add a new swap type for migration entries of
 device private pages
Date: Mon,  2 Feb 2026 22:36:36 +1100
Message-Id: <20260202113642.59295-8-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6b6000-7aa4-449b-9f10-08de624f6713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bi4nWog+T0dCUH6R7/yN24UfVtcFR8wCTo39A3ru22sDM4X+frGJDyA67uap?=
 =?us-ascii?Q?TUYkS/i0/86CcaN7nvSlPYwetO92F44dUqOcMbgcidcNdgukwGHV9HDStRw/?=
 =?us-ascii?Q?OXOwJUozNfNK83ti0n1BsOFqHdhGLxAzveZdx3t250z96ZMx0rYrvtRrgbmC?=
 =?us-ascii?Q?hWdHtglKQWOSksaiHT5kNjGCx86Tsz8JsO4A8+8b00yB7mMqG+tfp+oOgXEb?=
 =?us-ascii?Q?oug2J5WiqYjym93qn6cgn4f0Kp0Dz2y1kaf2fqcFqeI4ekY2hJyWHHumCr0u?=
 =?us-ascii?Q?Rh2r+I8jUjPjQKH0WDmWzepCySQ+JLQiqLcswmYOZroVEGfPjeI3M1nsiI7J?=
 =?us-ascii?Q?bMXQgwJ0KCju0c/Y6yChSAkLUDZINOtvcWbFOuD4oOLOI+IGpgwLxo0O+a/v?=
 =?us-ascii?Q?QfXYpKLXjIkzkvBCD3rljqg26/DY+pBDV1cUx1UMHWFc93I67EoxDs0pGGD/?=
 =?us-ascii?Q?FRjQflntpr1ef/acNeWoo9I3RvMlWVeNvSYY91wioaJ6zJ1MKpG38xQj6zVC?=
 =?us-ascii?Q?GwUXaJDXJzLDjFF6wS77qS3AV38XLC4BWWPShFpBb18CAjGDwaUXEiSDAo5g?=
 =?us-ascii?Q?nZvzS/tmEl0c9pE2QosQfeOjGPU/150EAKggk70Sse5lRUjaF4yzbQcaLydL?=
 =?us-ascii?Q?xmbqNNhZDbvULarC3JdgRRlIzb3mnm+m/F2iqmu3q0Y8mnvp0Fvxaya33Vq+?=
 =?us-ascii?Q?CPOqdgen2K+jOWsF2GB/TZ7/IVDZr4LkyUHbreEIkhoTAuEnBgu8h4k2Cesm?=
 =?us-ascii?Q?FkKFrFXSIwU/lE+S0wIrs/zesQJHp7yGOZwzIslsrwPq3AUylxi9aWxfkVxk?=
 =?us-ascii?Q?Y/VxZKHKUZ6q39dHDIjLpPjDe2g8Q4RoJC0XSIgB9IL6KOghaVuF2ne+BNf+?=
 =?us-ascii?Q?MLSVPIH0HOXwxdBBdq68XaL34ABMGO+dpKpaDPF56OqOh1uPokaCAi7/NxkI?=
 =?us-ascii?Q?ZDSu8vYBBpOFzNOAo5GzYm5aOCtRZ6a7RGPk/jaBGCu4fEm/v7joLSAtr/Y0?=
 =?us-ascii?Q?iEn6yZHFDB4UOkzpaQXoUAA/g1JLcfHwx8G5FzWpUZ4cAdM2g/kaKPgy9V5R?=
 =?us-ascii?Q?IKuxsRUwsXG3jU0gjquaHePeylFMEBZeV5v3Trl5Ini4ZZ28xAXCP+WPfBJY?=
 =?us-ascii?Q?gE/sh5KO10K2w4JvKsA0EcYigQI5ryFG1cNqy0IHAV4lKXoda7nNCjWSt9tP?=
 =?us-ascii?Q?JzkjwjOV/Zhgaa/GFTVrKsM2jHLm8DrRRIKI+feEGgp56xfabRzQOY+osKoc?=
 =?us-ascii?Q?nnmzGqVQi2mCg99z26fG7HR9jkUHwG6JxIAIxPv3OJzAEfWaXLHT3l4P/Fmu?=
 =?us-ascii?Q?HrrsKEIW+VTBk+Vh5wqf2t/4vrcXztsLNc6H0rMn1oybZYgGL6gju1B54us2?=
 =?us-ascii?Q?zRLaePT4yAZp9io0B40reEy+D+mqa83YYRDqZ1eMqdmqzpiTUzGWMFV50mUM?=
 =?us-ascii?Q?eGLwMtPoPMDBavPxkLCBU/VI9Hiwf/HPI5dbv49BZBfBw7gychWQucEm+QTX?=
 =?us-ascii?Q?l325bup10HS9gk1s8WFQCKHY5SPlZTmbg5ogXSUoL4+V6fSsLgB9PzWs1NqE?=
 =?us-ascii?Q?ORe9DNXs41An2YMip1c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w8GNfMzSV349jnpGR7P89Tt7mzSfiHMUXfgy9or9CbE6dtF/4ehtTuwpzy3s?=
 =?us-ascii?Q?qpRilPIuRUCGQD9DpdIwMXdoDukv7Ijv6FFND1mqfVbFYPlwUVMapKgiztAQ?=
 =?us-ascii?Q?Ms8i/044sEe8dhmIzgtAgPSQqWtiX7VgrvMV14NcI5J2T/h2kY4oj4nh2SEQ?=
 =?us-ascii?Q?9zbfUgmz+o6MfBFEFBFQ5KWT8ajXFXpiGmMGlsKCmXgoRGzdMIEfxAH2BL0C?=
 =?us-ascii?Q?0pcZw6y98XkH/D708vJvVi2XrKB6vZ0xtK4h1cVXJ5Fw9Gnm311iOPDieVdv?=
 =?us-ascii?Q?8aiINv75tyFS5oiBGdfpns14AUPOG9GYCKsq6DInEsEhofbuR21JAig3QsnY?=
 =?us-ascii?Q?Ve+tVRv7WQJcba1cdLGulQmDWOZYmcbPOb4mfHU1oJ1aOIjzpLJ7/DuuWMkZ?=
 =?us-ascii?Q?afUh1Ui66xsrPx4hws6vHFvMXCuVN5PZo6/v3Ja/MJYDIgBf3qwcMJvmy8X9?=
 =?us-ascii?Q?9VZxd7svV1aECTPrv5aU3U8wbOXLaF97+gT2wa5jGdT2LUlWKcT7Qdnj6ql0?=
 =?us-ascii?Q?/BeU6iwr6HrfWUxrYaJHRL99uDo1MHVViTwryJoHwdV38OahZptoV3xLZ5Ws?=
 =?us-ascii?Q?duRgAvtzbwB6tDAkXByO0bbkBl3SS4rfUDKk83rGVUaOjeTuZ25JqUKyzmea?=
 =?us-ascii?Q?gCLBjyqHuDCYXj+kEPAFoTVhy5Q8G+Ux/HP+WJAvCjKVeGXx6dKfEf6+Atbp?=
 =?us-ascii?Q?j9EBH3KF9whQnIMWis/dxu1u0h2Z+pV5XhJl4yjgatrvootziyAyMWEJwFtJ?=
 =?us-ascii?Q?J5ZSyrVLJgHN6bEnuEPtRscn5WWhDLiR09sb3jPjlpkomsmKcmyL4JfMTFlV?=
 =?us-ascii?Q?3zVjHtx4M8Q3f3bcEEQqTqVfjASDbRo2vX5VT0y4aFkMQIcKaF8cqx0a+l8M?=
 =?us-ascii?Q?VVQQ4Fqesnc7H2S9G435yj04VW46t+T+s5zDzgS+k3oClkotvOpvtbjMaipl?=
 =?us-ascii?Q?dyCBzaqjjQ5o6CgjBnM6j/cdI5i4lS1NPRCpdLRdZZ7ZCGP0vvwiJYs/t3Ws?=
 =?us-ascii?Q?v6by6FzF5bOe/MiiK8IHNFjSApI4mxXun1/5YMdINvUMr44J5y6RZoG5//ld?=
 =?us-ascii?Q?6YBDBDObpK/BorOGSbIqW+3rp4PvflCq/cEG2KTgpmgjmy/8JIB/RckHiUwc?=
 =?us-ascii?Q?FeRp5WJ5uCgypvYQPdLlvEj90lGoHEDH0DIUYyQy4gqJc289z10Q9VxYbATo?=
 =?us-ascii?Q?ikY1TJUYkG/bbhCX7DkHSThzOA7oxJQi8WA5blpZjKLJDaHzWvx6iPVHrfrS?=
 =?us-ascii?Q?CnAOSJyAeM20vpCRb5U/Dfden3QZw6sda+w7nZO814ne4CldUF/3jOC4rWwh?=
 =?us-ascii?Q?/BhZnVzemBUWXyp1vHB3b3AhEIhmombVe6Mi794aeoXgjZ2eQLrXWzXGgAgh?=
 =?us-ascii?Q?R6oYvN2wqRVoWnzPuHPETUFFUhvRmikC6imk3IuUnJlIOX9dSZzkqsWsOerY?=
 =?us-ascii?Q?hRejhW9U26vcOgQ1Oyz4SmarK91pnxd019cm3qXyaGEIsoT2jW5unTiprPnk?=
 =?us-ascii?Q?4tGslWlKYlpE+uX0KkFFOt/F/+niWYLGEiwdbw577JdynQ2PTJ8tCUw2+gbT?=
 =?us-ascii?Q?2b9uIU2zVqWiI8/6uhYzGRNGbHMXitcpL6oeQk+EZSn5cSFDnBkRiTIEcca5?=
 =?us-ascii?Q?El/X7VRlJkIzGm/shrL1sdOnl/INHaNdEALYNgPtVVqYN4juj0u6hixE4HC/?=
 =?us-ascii?Q?4Vvz/7DbdlAvX+c+OkMquSG58oXV5K5tQapCabvJzHxiRwExnMum51iCNb+q?=
 =?us-ascii?Q?isN7D7H22A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f6b6000-7aa4-449b-9f10-08de624f6713
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:10.5655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqmCzYrXULw1ixtfMne9YzBtyMhCr1YUqoj51ekYgCylyH/25kHgB53wjSbIrMj/4n50KC6VIzLL4eFnFj9aKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[27];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: B18DBCBC24
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
pfns and must be handled separately.

When migrating a device private page a migration entry is created for
that page. This includes the pfn for that page. Once device private
pages begin using device memory offsets instead of pfns we will need to
be able to determine which kind of value is in the entry so we can
associate it with the correct page.

Introduce new swap types that correspond to the existing migration
entries:

  - SWP_MIGRATION_DEVICE_READ -> SWP_MIGRATION_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SWP_MIGRATION_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SWP_MIGRATION_READ_EXCLUSIVE

The SWP_MIGRATION_DEVICE swap types are meant as specializations of the
SWP_MIGRATION types - they are equivalent except the new entries
contain device private offsets.

Forgo creating new predicates for these new types in favour of new
softleaf predicates that will be introduced in a subsequent patch.
Currently the softleaf infrastructure does not have the means for
creating new entries so provide swap entry helpers to that end.

Actually using these creation helpers is deferred until a later patch
when the softleaf predicates have been updated, otherwise the existing
checks for migration entries would be broken.

Note that SWP_DEVICE_NUM is increasing from 3 to 6. This reduces the
maximum number of swap files in the worst case (i.e.
CONFIG_DEVICE_PRIVATE, CONFIG_MIGRATION, CONFIG_MEMORY_FAILURE) from 24
to 21.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - Update for softleaf infrastructure
  - Handle make_readable_migration_entry_from_page() and friends
  - s/make_device_migration_readable_exclusive_migration_entry/make_readable_exclusive_migration_device_private_entry
  - s/is_device_migration_readable_exclusive_entry/is_readable_exclusive_device_private_migration_entry/
v2:
  - Add softleaf_is_migration_device_private_read()
v3:
  - Move softleaf changes to new patch
  - Update commit message to explain the change reduces the number of
    swap files.
  - Move creating the device private migration changes to a separate
    patch
  - Remove predicates - we'll rely on softleaf predicates entirely
---
 include/linux/swap.h    |  8 +++++++-
 include/linux/swapops.h | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 38ca3df68716..c15e3b3067cd 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -74,12 +74,18 @@ static inline int current_is_kswapd(void)
  *
  * When a page is mapped by the device for exclusive access we set the CPU page
  * table entries to a special SWP_DEVICE_EXCLUSIVE entry.
+ *
+ * Because device private pages do not use regular PFNs, special migration
+ * entries are also needed.
  */
 #ifdef CONFIG_DEVICE_PRIVATE
-#define SWP_DEVICE_NUM 3
+#define SWP_DEVICE_NUM 6
 #define SWP_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM)
 #define SWP_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+1)
 #define SWP_DEVICE_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+2)
+#define SWP_MIGRATION_DEVICE_READ (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+3)
+#define SWP_MIGRATION_DEVICE_READ_EXCLUSIVE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+4)
+#define SWP_MIGRATION_DEVICE_WRITE (MAX_SWAPFILES+SWP_HWPOISON_NUM+SWP_MIGRATION_NUM+5)
 #else
 #define SWP_DEVICE_NUM 0
 #endif
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index c1d3c0e8981b..220627cb7fff 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -148,6 +148,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(SWP_DEVICE_EXCLUSIVE, offset);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ, offset);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_WRITE, offset);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(SWP_MIGRATION_DEVICE_READ_EXCLUSIVE, offset);
+}
+
 #else /* CONFIG_DEVICE_PRIVATE */
 static inline swp_entry_t make_readable_device_private_entry(pgoff_t offset)
 {
@@ -164,6 +179,21 @@ static inline swp_entry_t make_device_exclusive_entry(pgoff_t offset)
 	return swp_entry(0, 0);
 }
 
+static inline swp_entry_t make_readable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_writable_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
+static inline swp_entry_t make_readable_exclusive_migration_device_private_entry(pgoff_t offset)
+{
+	return swp_entry(0, 0);
+}
+
 #endif /* CONFIG_DEVICE_PRIVATE */
 
 #ifdef CONFIG_MIGRATION
-- 
2.34.1

