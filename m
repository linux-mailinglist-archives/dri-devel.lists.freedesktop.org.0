Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7212B09C80
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E3610E906;
	Fri, 18 Jul 2025 07:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qMQ7tjQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D74710E920;
 Fri, 18 Jul 2025 07:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDgoZJkUd/OGOFHLN315HyBsxJW1KaW5sbglhXU2Xp0YJrW5yBNkyE+5O35sFC7F/fTV3N8B30hvdrMjmc/+UO8VdwjkxF3IDtumYcUkSnJdgplD9n2Wqr/A7EPbd/sY8kH/ZeuCbFIeba/Yw7iltbf/5yxi/wE3x1G8jASE7KTG/nddkVm6FYAbgr8XqvoOoqNJNVoQJQ27wU3kv33spsXi9+2G5RvGVVCkLYVKsjgOfKEUtvC8a0byf1gJm/mGn20atgpvSgSlQgcJYXY86X0EgW/4Ux8h79o2qzVFIZSVIgXlDBTYAe9O7ZYWatzrCbzVD8B3iEDOnCrw3Ulqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VJOo8YjWHEfL81msuZBZRQkrmA/gVduJUjNQJfdWJo=;
 b=aihymz4Nc8izqtYtuj6W4+ZyFrQe3zxG44rDmOD1CcLtGWmbPlXcO9x4fXpy5IaZRuBDdtn2saDM48quCBOjlcICJLoUg1tZixBMwP8BsmzGjBoCgCsLfskpZvYy9Nw1vfaQW7oGNKEeA/RfKmO4AdOsZeegAOL22KgRwWxU8LH4UzPOGoEI06KLAm7eUsLXPGnvx8ffuLwaMJ3G6dHquJFqxXghzQonlhEbiorMm4ijrSTKqf5O/oIHyqsi+qSx+hekKUajrKE00HrtP6iAZ34EU6VpSX3Jsr/KjZ18AR0K56aZMiJnGmf8HvHc6EjmJu640Rkzivqniufsz+FYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VJOo8YjWHEfL81msuZBZRQkrmA/gVduJUjNQJfdWJo=;
 b=qMQ7tjQoJrL5Rf/Mi8zfcLtXXmhp42i9UvjircKMp1Ckj2iKu/OgsnYrKqTmKOPIrbNbLohbQYR2EwptHUd6v8gHe/mWXAd7X20HbKV5HSuiMS5paPmdei4X+NEiyWc1KaGx8cJzh9Ccxa7ZOnog32eLbZrhaOE/lLW7e46pNrg2CZ17PfPUhcUdXwOelTHiZehK8StMjxS85o/WxSocnvJnz8WG27HM8XjvwYNAoUog1xE8DBmUcqkeSiCamjhEdGW3XZGzXCL6enObOLVNjLMf964J5ygEOZsatg8qi16OjfEBUVcbpWa6QLdykrHgjAKbsdDpypGlTKRU8y2Uag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:24 +0900
Subject: [PATCH v2 19/19] gpu: nova-core: register: add support for
 relative array registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-19-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0248.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e06537-882d-4365-c4cc-08ddc5cc8a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDI2UDBuaTB1SDNOQ1lCcXJmNHhqZDgxMS9hblBKRHBDMWljNUFZdjlwUm4w?=
 =?utf-8?B?UWpadnc2SkJBUW9FSENRZnAveENydzR0NDNtNWFwbHYydTk1YlJpbHU5Y1lI?=
 =?utf-8?B?bTllRzhRMFNrUTBSWmRqcnZXck9YaVVQUzVlaUhPM1ZxcGVpRmp2MGJES2tD?=
 =?utf-8?B?YjlUUisxWmpFNHVoMTFIbXV6V1N6WkZrSDA5NWhQbEFkaVhrdnNlUlkyN3gr?=
 =?utf-8?B?ejVTOWlZa3VyVGFLdDN1dEFrQUhjbVd4V21mdzFEOWthK2pyTC9HWDJpaTA2?=
 =?utf-8?B?Z0czU2dYK1FzR1BEcklqeW4xUDlZZ3p5UC9UV0R1b09YcWJwSDhEVGtac3Ju?=
 =?utf-8?B?cWZobXkxSkNkeVg5WUl2eHR1WjBWeU9meTJHOFdMaUlWQTIzaWNsV3o4eWVl?=
 =?utf-8?B?OEYrVUhuSnBRcDl5SHk4b2ZlODlFd1o2U2ZnVCtBeHJ0UDBHVmVVc0RhZFVz?=
 =?utf-8?B?YVo0T0pXdFJRc2VrYURsN2d4cU5OWWs4MXhXaGYzbXQzcWtOTVdxWnhIbnpl?=
 =?utf-8?B?SThicW1nemJGWWtpem5kVk1ocHVURzQwb0kvclNYeWFsbGl3ckU2TklxVmZq?=
 =?utf-8?B?Nm5DcHRQRjhiN0ZreENPTGVvV05pcW5PZTBuQWFIRnF6amlBbEZnY0hDM3Jk?=
 =?utf-8?B?emtMLzN6MzVsZmpNNjdncVg4RGV1bEl2cGxYNldJblRycVBNQWlzSTBvRzhv?=
 =?utf-8?B?RHhuZXpIellxN3NxcnJvYjJOVzlmREZ1OHRaN0thSzU2QVM3UHVXL2JTZnNJ?=
 =?utf-8?B?b2VFam0wZSszd2RIUXh4bmZwTVdDRXhEREh1ZDEvVSt0K0d0WVdtZG4wTlBj?=
 =?utf-8?B?VFFHcXlrVGxXZ1E3UFNkRXdadzJOKy8vQjRqM0NNOUZYVjQ1a1JnRXZWaVJy?=
 =?utf-8?B?a1RNOHdhemNNdEtIUi9IRTVTV0RaVytMbVlnWTllQjBOQ0cwMmhHRTY3MzVD?=
 =?utf-8?B?MkRzMFkzdmVpQW41QmtLNVFYWW52azRpMmU1V2Z4MlgyWTE4V3FBTHQ4RGFR?=
 =?utf-8?B?M1g3dWlpRm56Z2lma08vQXRudEJIenUrREIvaVYxcUFOZWZpM3JrRFc1ZXZ2?=
 =?utf-8?B?OUw3aXZaZFNFSVZiWEx6bisyd2phWEsyd2ZsZHhQSmY4dWFnRHZvVmxFOUNQ?=
 =?utf-8?B?VVpzZzdyWDFNWmhCMC9rRWZRQlAzdStIVUtKY3RGZXExYVpVLzZ2SnNoN3Rt?=
 =?utf-8?B?dzJqYzU5Q3ZoWU1VTno3cEttVU1zdTVrRXE3clFhTk00bXRsZ0dNd21HbW5i?=
 =?utf-8?B?cEwvczNsVndHZllleGYzbGdjUzFZV0hXWE43bHVFa0NSanNTWlA5KzIvOU92?=
 =?utf-8?B?blEzOEtxQlhoSWY1d2tKNC9hYlFyc2xiUnpvanBMNkEyYnBsZFBJZW9kNSt6?=
 =?utf-8?B?NkN5RUduR0FYZ1VFYlJ1dUF1d2lJa2pmZlVGYzUrMTJMOWovaHR4YTdsamZT?=
 =?utf-8?B?RWVPKzZsY0NMUDliaGxZYStSakVZRmpuaDRnWVVFTUtOY3h0eXM0RXFaV3cy?=
 =?utf-8?B?ZFJmTWlIU216VEluU0tpMXhMb3RqalVxSWt0SVlEQ0pWR0lLZmVhUWRJdGUr?=
 =?utf-8?B?L0dCOUtGNVp6a1M1MER0ajlSdVUvbW9JUmZJTnZ2d0IyeXNma0pKNzZxR2Jm?=
 =?utf-8?B?NlNMNmRWbWhySFdQQjc1UXp0QWlkcU1SUHhvMWU3a0V3SCt3T3dFU3IxWmVE?=
 =?utf-8?B?b0x1cFkxbWNTZkVlemZ1akFRVzVGdjVlSXVaWFp0L25JOFFHdjBmbC9JenhO?=
 =?utf-8?B?alJtYlFQVmVWMm52dUJYUTdoYkhZZ3ZZcU8vTlhOUXR6MFl3ZzBzWFlaRmJo?=
 =?utf-8?B?TzljWnczK2orMlNDc09Ldmc4Q09jeUw4YTVRQlVZbG5ZNlhNeElOOXlPYjJV?=
 =?utf-8?B?MnNZWUpWRDhBT1pCcDRBSXdOTUd5NEczZXdtNWZsKzQzb2FuRWVYNkJTVDRp?=
 =?utf-8?Q?qAzvXZb8Uus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0s0dGY3TXZiZzh1bDFMc3ZUMERCWFlDcDNNcUVaRTdGYyswQ3JpMHhIdW01?=
 =?utf-8?B?R1pxTUFnM3FYaGJQNTV0WGwvYUlqZjVEa1FCUkxueUxFRE80djJnMEQwSk9U?=
 =?utf-8?B?OUNRQzZId1dXWGRHOC9BRFJHaElTclpMb2pVU1B3NkFTazR1VkRsTzkwVFJh?=
 =?utf-8?B?dXB0ZFZhTXRqUHFZYjI4OUgwRHZxTjJrc3IwSHRmdWw1NW1xRUZoN1NabFVz?=
 =?utf-8?B?d1M3a3J2aFUwRUFOV2Q3SWdocSsvZjNqODlaRC9KejlKMjBjUU50NWVNOUtj?=
 =?utf-8?B?enB4ZUEzT3d1TndEdkhtZWpVbmVkRVNNc0pzMTl0YnJsS1FlbVMycVFKTTRk?=
 =?utf-8?B?d1ZYK2d5SnpkQ21zQ29wVk5OWituSkdmZXRsbGlpdjQ5ZnE3d0dlUDI3Y0h1?=
 =?utf-8?B?YjdVbDEra3czL01MNmFKbExpV2NGV2RRRkdzVFUrcjhTRDdkNmp6Tlhqa0E1?=
 =?utf-8?B?c2NQcFppTEY1Y1dTVVdiL0tVaU80U3cxNFp6ekJuTXc3aUdPM0lxcXdXVk55?=
 =?utf-8?B?d1hGUmxPWUIrcmVETkFKdnI5YVpWREQzRThTS1NhNW5zQUE5c0NyZ0FNSGxy?=
 =?utf-8?B?ZHp5bGNKVmY4ZjdJNXAwVURTSmxRL0tGVGZHZEM0bSszR3YxUTQ0RFJoamlC?=
 =?utf-8?B?bHhYMFRvVW1nTzd6RmxBWm5qRG9jdWVZL25wVlEzQUpCc2lpVHZVbWRZMS9U?=
 =?utf-8?B?K2pZNU9RQktmcmdTQVJUTWFrdEN0aSs5UzUxZ3loMGhjOCtnVlhrcmdXc056?=
 =?utf-8?B?SGl1VUIxRnZZMk9XU2I2alNBSkdQWjRiU2NmeGdBVnNOVHdtZzgxRGdlbmdN?=
 =?utf-8?B?K3o5QWFsanNaVlhtTFVWeExNUzZHWkRQV3k3WGJVVHdKbWN4Q0ZrNFhFUyt2?=
 =?utf-8?B?eUFKdnozU0NMRnd0Uy9OUUs4RDZTMUdGMGw3cjJxNW9FZU5VaWpETkhHeEp2?=
 =?utf-8?B?VWQ3ajcvRmJPNEFQWnhTakRYelU0c2kraWRFRGhsTGVZZnJTbkhjaSt4Q1Js?=
 =?utf-8?B?RjhLcTVHNW1xTGp4MThNNnc0NEtmTlIyZlNUMGJnNTJPL1JRUzhTZXppQ05B?=
 =?utf-8?B?V1p2WldSWUJvRTFIV2tzOTR6eVBwS2VUaGJhYkxjSjAyeVBkbDNjOU1IS0FF?=
 =?utf-8?B?S3lzamJFdWc3eEp6VmJMQm9SVUk4Q3lBTi85ci9LV1dGa08yZFVuOTIzYUN3?=
 =?utf-8?B?MFR4UVkydXk4U1pPaStISmc1YTgvRUdiUGFWYStCcTcxSm5aUzdCeFFVRW9K?=
 =?utf-8?B?cGl5R1lTOWdBZVhMYkJPUmhUL3YyRDNRSjBtQzNBYm1hNHNOeGVKa1NxbjYw?=
 =?utf-8?B?WUZVMzlPeThnV1pyMG1MVVVQeEtwOHB3YjVPeXdNTFhEb3hSNEw0TDVIZ0ZH?=
 =?utf-8?B?N2xIaGovcWkwOWFDTzFaL1V6b1JBdk1HMTAyMTVSYW1FR3dNM05WLzhRTjd3?=
 =?utf-8?B?RCtnQkNHTi9EOENuTys3NVI0bERaL2ZEVDg1bGIxaHUzRkhJQXdwazROSzJD?=
 =?utf-8?B?UDBwVFhIWVllRW8rZ3hUQWFBN0pocTF4VEFvS2ZVSG05NC9LWmxkZjNST2NB?=
 =?utf-8?B?NkEyYmZlRUJZTTBMVklCRDZLMk0vdWd3NWVSRFFna216QXA1dTM4cTcyM1Bm?=
 =?utf-8?B?UFRCRjhhbUZSN1BwV0FaWHUraGRoNGlEQXlwY2s3MkMvMnp0YTFweFJvTkFP?=
 =?utf-8?B?ZTkxQmdxUzJ2Q0I4ME9ZOHFBQ3pvWGwzaVI3VU9LdE83a2hTMTY4SVZLRTV1?=
 =?utf-8?B?MGpjS0JhdFQvNWMvSENGT1NSeWxLU1NXUXBqSVNVYlNRYWZ0ZEF0QWJFRm1L?=
 =?utf-8?B?dS9GQk5CdUZTb01za29IZ0N5R2NVajMzWm50eEgrWU92bm5ad2VtbER2RjJI?=
 =?utf-8?B?cGV1YWM0SmVUZEhnTFpZVUFwWGo4bWM0b1NqU3RNeHlrMkNORnMyN1YyVExD?=
 =?utf-8?B?bVVPTTIxUndBY2VjWnhsSTM2UVprRU9rN0dRWkNBTFJDVnUvcnYvNm9lSlpQ?=
 =?utf-8?B?N2VxYjZ4aGpGVUU2MWk2MDdVTTh5VVVGL1dwdmRoNmJhRXkrR3JjT2M3dnpH?=
 =?utf-8?B?a0hNdzNZMjlHRUpKR09zbU1NU0FUSmpyWlF3SnlpbWtldHJSWVhvYWxkWTNS?=
 =?utf-8?B?dzFZVEF6b0tVUDNHZUFmUGZCN1hxRnJ2SVhUQkgzMWhkYUQwT2xpUm0rMFht?=
 =?utf-8?Q?LdNYFSianusabohZRc9JVA8vwSj2wA5ob6kfTHO2wRja?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e06537-882d-4365-c4cc-08ddc5cc8a47
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:24.1478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iaRVMRtycGQai7J/QrmmwK0f6Rxkrcmb9XXqYuPnCPuZxEaaGjMUaQibRsdKX1iJS7TeLrlDsqOYaOZVCUW5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

Add support for declaring arrays of registers available from a variable
base. This is effectively a combination of the relative and array
registers features.

nova-core does not make much use of this yet, but it will become helpful
to have for GSP boot.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      |   1 -
 drivers/gpu/nova-core/falcon.rs           |   2 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   2 +-
 drivers/gpu/nova-core/regs.rs             |   8 +-
 drivers/gpu/nova-core/regs/macros.rs      | 242 ++++++++++++++++++++++++++++++
 5 files changed, 248 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a1d12c1b289d89251d914fc271b7243ced11d487..48b20656dcb16056db7784fa186f161126aae9aa 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -131,7 +131,6 @@ crate so it can be used by other components as well.
 
 Features desired before this happens:
 
-* Arrays of registers with build-time index validation,
 * Make I/O optional I/O (for field values that are not registers),
 * Support other sizes than `u32`,
 * Allow visibility control for registers and individual fields,
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2ecdcc6b9b9dea39889eb9e41e3a8293fc56a54d..d235a6f9efca452cc46e2d13c61789eb00252de2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -516,7 +516,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
         regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
-        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, |v| {
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 13c945fd6d6b7b1acbb466678af0bf18da506265..0b1cbe7853b3e85cb9c03f8e3987ec50a30253fb 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -73,7 +73,7 @@ fn signature_reg_fuse_version_ga102(
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
     regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
         .set_value(params.pkc_data_offset)
-        .write(bar, &E::ID);
+        .write(bar, &E::ID, 0);
     regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
         .set_value(u32::from(params.engine_id_mask))
         .write(bar, &E::ID);
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 05a728e9c9881ec315aac8448d11035501eaa559..dfac6bf4fd72cb75729fd6bc179c9d52844d94bf 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -288,8 +288,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     0:0     reset as bool;
 });
 
-// TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600] {
+register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
     1:0     target as u8 ?=> FalconFbifTarget;
     2:2     mem_type as bool => FalconFbifMemType;
 });
@@ -312,8 +311,9 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     31:0    value as u32;
 });
 
-// TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210] {
+// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
+// element. Be conservative until we know the actual size or need to use more registers.
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
     31:0    value as u32;
 });
 
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 0b5ccc50967b1deb02cf927142d5f422141e780d..7c00647f716bd42eb30a286a6cd4a1e3ec26f16a 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -213,6 +213,74 @@ pub(crate) trait RegisterBase<T> {
 /// # Ok(())
 /// # }
 /// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// # fn no_run() -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub(crate) struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as an contiguous array.
+/// register!(CPU_SCRATCH @ CpuCtlBase[0x00000080[64]], "Per-CPU scratch registers" {
+///     31:0    value as u32;
+/// });
+///
+/// let cpu0_scratch_0 = CPU_SCRATCH::read(bar, &Cpu0, 0).value();
+/// let cpu1_scratch_15 = CPU_SCRATCH::read(bar, &Cpu1, 15).value();
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = CPU_SCRATCH::read(bar, &Cpu0, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime value returns an error if it is out-of-bounds.
+/// let cpu0_some_scratch = CPU_SCRATCH::try_read(bar, &Cpu0, scratch_idx)?.value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(CPU_FIRMWARE_STATUS => CpuCtlBase[CPU_SCRATCH[8]],
+///     "Per-CPU firmware exit status code" {
+///     7:0     status as u8;
+/// });
+///
+/// let cpu0_status = CPU_FIRMWARE_STATUS::read(bar, &Cpu0).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(CPU_SCRATCH_INTERLEAVED_0 @ CpuCtlBase[0x00000d00[16 ; 8]],
+///           "Scratch registers bank 0" {
+///     31:0    value as u32;
+/// });
+/// register!(CPU_SCRATCH_INTERLEAVED_1 @ CpuCtlBase[0x00000d04[16 ; 8]],
+///           "Scratch registers bank 1" {
+///     31:0    value as u32;
+/// });
+/// # Ok(())
+/// # }
+/// ```
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -260,7 +328,41 @@ macro_rules! register {
         } );
     };
 
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        $name:ident @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<u32>() <= $stride);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        $name:ident @ $base:ty [ $offset:literal [ $size:expr ] ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!($name @ $base [ $offset [ $size ; ::core::mem::size_of::<u32>() ] ]
+            $(, $comment)? { $($fields)* } );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        $name:ident => $base:ty [ $alias:ident [ $idx:expr ] ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
+    };
+
     // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
+    // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
         register!(@core $name $(, $comment)? { $($fields)* } );
@@ -715,4 +817,144 @@ pub(crate) fn try_alter<const SIZE: usize, T, F>(
             }
         }
     };
+
+    // Generates the IO accessors for an array of relative registers.
+    (
+        @io_relative_array $name:ident @ $base:ty
+            [ $offset:literal [ $size:expr ; $stride:expr ] ]
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+            pub(crate) const SIZE: usize = $size;
+            pub(crate) const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub(crate) fn read<const SIZE: usize, T, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+                let value = io.read32(offset);
+
+                Self(value)
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            #[inline(always)]
+            pub(crate) fn write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                io.write32(self.0, offset);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            #[inline(always)]
+            pub(crate) fn alter<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base, idx));
+                reg.write(io, base, idx);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_read<const SIZE: usize, T, B>(
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, base, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, base, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::alter(io, base, idx, f))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+        }
+    };
 }

-- 
2.50.1

