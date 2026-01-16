Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F84D2D158
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 08:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DAF10E807;
	Fri, 16 Jan 2026 07:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b0968u8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22A10E807
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCGSz0ZY+Y0M9N8ea9PuknYKldul/OErpQ7yKG3eBmWJgEFuBof0XvcSo06gxsXnLy9uvC60vUVhc+DGkpV+NiMywerOyzI1JDgVFOUbPxvOR4ZMhe90hRmeTN92V4xjIdjlflUIcPEcYfUF8kS8juituZxB0V4hiqegnQ+y0Y2//H7rY4rcfgSebgez1cNxlKNJgrc0jsNzLtH344a7kI2yqkOkxCgokz6VcU/ydPGYNySYh9isxBzoBSz3GxS+CtJqKdkWH7uE/XJVw6QBJs1Nmj3ujeCUWs+8e5U0ecXdDwGN0si2I3hooV+qjDibFzviSVbO4YP6Rmm3Yg5c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6o6vB+ZCGkAIBdv9DzJBJbxeUmiR5QP+uaGQzBVEao=;
 b=M6ZpGoZLA4XBiDGXKbUU47c1Gmyd5lfZFBrPFb8J3hql0CT8PFchOoDdyRsFq1y45JAJbMYCQ1QCGtoh8n8lyk681uf2wsb8h4sjLMaB9VC97hqFSavTBt77vcO78PxisuDbmQD+orEfiVqd+ViKfVAhi+nmzPB7rnivdnm3Amk3KMxjOlOf+3fHiyNzhjWzyXZD2nucXI6k/M2WcbzOxx17EXyusy6TTds7n43Yx6ZQK0P/0lT6W+H9B9OsfS1pdZ2mS7GUTQQLu1slo14GjGU36yA3wGbbnNTc2G7v6FGTFfKtvXLvUUdsDfhVIfzJ43okYQ0kqJcBdFyyQ9+u3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6o6vB+ZCGkAIBdv9DzJBJbxeUmiR5QP+uaGQzBVEao=;
 b=b0968u8h3Ff/MwdFbW/+AuHiSiSlOMLEzmKZ5mvEy7MKqVEFMDYvyUkXLRRrIdxa14UCsRY/Ei3u28Y5zbSVdiIqM1L6iXxeCITXPPINojiKX++Q0q0+7T2+tPNpLxeVwIEVa385ROxw/Iky8n78D45FHmInBkCyXICBp4JjNko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 07:20:48 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 07:20:47 +0000
Message-ID: <2ae03f22-740d-4a48-b5f3-114eef92fb29@amd.com>
Date: Fri, 16 Jan 2026 15:20:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute
 workloads
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Honglei Huang <honglei1.huang@amd.com>, David Airlie <airlied@redhat.com>,
 Ray.Huang@amd.com, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
 <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU3P306CA0009.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:15::13) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 915e6219-f937-4776-378e-08de54cfc4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHcwYVNOZVhwRTZmQXRMSkZlNlUvOSsyc05McW1HWExwQ1F1QUpPS3QvYVdV?=
 =?utf-8?B?VktlL01lL1J3M0RiT0ZtdExkemNIOTJHanlVVkIrWjRtWGNUVzRkMng5MUsy?=
 =?utf-8?B?bXc1YjBiTEtjd1MzYW4zbktNT3YwbzN1d2hZWDh1bEZIT1UrcFVhZXVLWkNp?=
 =?utf-8?B?dzlhb29vVjJBSUdTb3l4RmNSSUQ3UUpxVC8ycHhaTE1BQklsNXNwdDluRG5x?=
 =?utf-8?B?MEdqRTE4c3diN2ViZ1NIeW56NVpYUlA1QzNRQzJCNmo0d0pGUnlna0pYeW51?=
 =?utf-8?B?RTlYR3ZoK0oxa24xZWFXcEVkVVRsSTNITlhpcXg2NUdGWlRjUE0ya0lNVWRp?=
 =?utf-8?B?dUdLNXlJRXhFaG5PcFVPb1AxVkpMQTFIQlo1Y0JUdE80RlUvU2JzNjB6ZkFt?=
 =?utf-8?B?QjRoR1dOTFMzRk9mUXh2SGxreUJ0dVQxSTRPUWtCekRlMTdUTGtuVkRDcE1V?=
 =?utf-8?B?V1ZzTC9QODVPQVVSNk5OZFFiTmd6S1VGVzIyeFN0TUJycElqV09xNkxQYUh4?=
 =?utf-8?B?T1FZMU80ZEwyb0paTURYcUtJMXFHS2RQNWZGK3Fidm1wV0xJNHgzQUQxRUI5?=
 =?utf-8?B?b0xMUnZOVm1VK1Z1OEFkaHNMMUc2c1dVcDZOUGxrcmlkRi9FRDM3NTlMNmps?=
 =?utf-8?B?Z2ttdmgrQ3ZkQXFQN1Nxc0NPaXl5aERRT2JTeUZlL2VxOTNTQ1QxUi81Sk80?=
 =?utf-8?B?TjJxVElMN1A0TFpVNUFtVzZzQnVVSUkwNXZzUFA3SkNkeW9iSkl3WVZRdHNK?=
 =?utf-8?B?em1XN3p4T1BPMHRiNkRxWmxhY1l3NmZRVjFZZnlRK1kxSkNmbWUxT0xvQ2VK?=
 =?utf-8?B?NnJNWDlDcnZISUJmWEU0L2JEdnpYbm1UaHY5Z0J0M3lIY0tMTzdFVk1MMjZi?=
 =?utf-8?B?VldNRS9pemJ2Nzk4Y2dubW4yWVFpSlhONXRLNGdIaU5iVnd5ZDJwQU5RZ044?=
 =?utf-8?B?emErWWQwNDRWSFQ2WlVuSlo0dWJlRzE3NnJ3bjhPQXVaYTRTRy9NbW9YckU0?=
 =?utf-8?B?S00xa0pzSWdhVDl2UG9WYUxKR0R3eW8wa1FpTFg1MWlZRmtFWGE3bXE5aFl4?=
 =?utf-8?B?MTgzS0pkK0NjeTVvSXUxWnNwY3R1aml3QXA2RHBGZUVhekJ6eVpBa2VIdHo4?=
 =?utf-8?B?OEMxeVpaYlEzVnFEa3kzOFhEZmx3ams0S2U3bWlYOFkxRlkvMnoyRGhkZnJt?=
 =?utf-8?B?clhlVEU0SEVVbWNneGpYZThPU1lpR0VISU5mL0k2Qm56U0pxbmNJMkFXZ3Bx?=
 =?utf-8?B?d0txeHJJZlh4Unl6bWZ2RDYrY3c3TEluR1drN2hNdUVkb3RDbDIyUldFOWRB?=
 =?utf-8?B?OWJUV0pkNWxZSVFIeWQ5WE8rTWFrK2JUQzhOWnUvSnNqOTNmbmlJVTBkVEM4?=
 =?utf-8?B?TGpiYWErY3BsdUt0cW1CM3U3LzRqaVk4cG5CVGozYkZwbjVDRkN3R2taQ3cz?=
 =?utf-8?B?Umt1UmQzcmNuenQ5Y3ZXWGdpdXNIVGhXSHdpWkM5NEFxM2ZtWnd0bmdQOUFQ?=
 =?utf-8?B?Z0xuUFVuN2tsYW90aUYrT2kyNmxPQU5Yckx0ZFV1MnlxSGZjZFpJeklGV2Jl?=
 =?utf-8?B?YjBmYUkwVElUVWZjbzVQcm15OUYydHExYzFSOEVYMGc3QnJMb2JxK1Rlelds?=
 =?utf-8?B?S1M0UDJQaTZGSlNObFJzUXE3bkZ4dHE0Rnc3VklrZ0JmbUs2aUpNVlA2RzQr?=
 =?utf-8?B?VmIyNkpTaGlCQmFwam9SSlVqb1ZwbFFraFlMTmJMTlJ4YWkyZElGMHN0RDZ0?=
 =?utf-8?B?dFdVdVJzb3BZc1JuZWthNUtXMDROSnVuM0tGcXJObXMya1YzUng2aERmdHJt?=
 =?utf-8?B?Tk4zalZVOVFOamt4dXNrOGJkQ2dpMTBZdjNBM1VzdnhFWDU4b3lrSThRYmJM?=
 =?utf-8?B?ZXhuK05VYzNCMWNpaFp2aE5hN3lDdW9GeDBKbEFvV3N2dHlGY3RPNDhGbDVm?=
 =?utf-8?B?NHFvUFpYZjQ3TjFERDFISTZ0cXJlanpPMkJHT1ljSm11SE9UeTlWVWFPQXJk?=
 =?utf-8?B?N3NKWEorUW1WS1lsNW9PMWx2b1J3QlhXTVU2b1ZQWU9pQjY0NS9pMFpteEc3?=
 =?utf-8?B?Sm1LUFlFUUswQm1QeTVVN2NqTjNCbklrbXQ1c0VtWTNqRC9ITGFEVEp4TWNy?=
 =?utf-8?Q?DGMI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzJhTE5mUEQ5YXJpbVc2TzB5Ky9jWGl0WGQ2OFp5TjdkVldHYjBlbk1wdk9a?=
 =?utf-8?B?UVk3RU95b2dQL2hEdnNaTGpFVS9LblpVcUFHbXM3MkhqcVUwdHVrYUZ4Skph?=
 =?utf-8?B?NWtvdnY4TmthQmxIK00xd2tsNHg1eTllWXRhcyt3aEE4N3hjVUNjOGh4Q3lw?=
 =?utf-8?B?aGZJeVM2d01qSHZPdnJtSEkzN3FuWnRmNXpFNmU2bXJVd0hYaWFvNEpQVHQy?=
 =?utf-8?B?N1ltWUtjdDQyeDg2M1lhajFOa245U0NUM2Yyc2hxMEcvS0lhMWJiaytmUENq?=
 =?utf-8?B?WU9xcXdCSVowbW1lem52OVdvMjFpRmYyeE5QMjg0eHJ5Tm1VTEpJL0R5cEtK?=
 =?utf-8?B?Sm1Ud0tSdDZyakNTbUl3TFB2elJUbmlXaTBQUFB4ZlVpUGtaTmJCcDcrQU1F?=
 =?utf-8?B?UXdWOUtyY3NleWw1ZUlzZXdxTXZkYys1ZEh2QmFIMnFhV2thTWdveGlOdjNG?=
 =?utf-8?B?L0NoaG9KOXNvWG9Sc2VtN0ZwTDVmMTBuT2tZQkF1M2J2d0xLeDhpS2MyYzRa?=
 =?utf-8?B?ZjVsZ0R6MWYrejA4RTlRRVgzNnB4UE1UdjdrM0h4Y0pTV3l0aUI5VXBZdjFi?=
 =?utf-8?B?Z095dmM1d0daOUkyTDFoa2h2NnRMQ1EzUllUQVZWUCtuVk5HeDNwc0F3bVlE?=
 =?utf-8?B?SFl3eGR2bWhpZ29OVDBDUlJXemZaNEhCSXVnbkc2aDEvRkdGQldJa1RwZkox?=
 =?utf-8?B?S2JyMDRUMFBheUpLWU5OQnhvRVA1WnlDWkJJZ2pwU2lBdDFtN093VGFZUFpU?=
 =?utf-8?B?SUVCSEYyN0ZIMUJ1UW5QdTQ3TjZhWFY1bmNWY2x6Q09qamM0dUtkSjJWYmF0?=
 =?utf-8?B?Y2pJcE4vcXZmUXcyM2QvdVB2dnlhTFYwdlVyWlpFRERhYlhOSzdZRS9PVkdR?=
 =?utf-8?B?WEUzWWxQdUFxSm5mNHA3cGVzWHIwVkE0TzVFendqaWt5bEQ3YnRYN3MvNHZ0?=
 =?utf-8?B?bS8xYlB3VWppNm9rQUlnQjNCTklNeW8yR0tZRFlDS2pvOHFpaXZQUU5JVnA5?=
 =?utf-8?B?a1JIMXpXVmFUcjNzL3Y1ZkhhNXd6eThyK3p1ZGkvNHo1NTk4MDZnUjhNMXpm?=
 =?utf-8?B?RXpMdGtsMkY3SUppcEhnSmgvMlhxbDdFZE1OcXVKclR4UW5sdTRZK1NlMzM2?=
 =?utf-8?B?di9ISVlEUVhZL0NISUJtRlhMNEllTmgzbEtWcG1vbEt6QXp5aTJWamtKdFJa?=
 =?utf-8?B?aEM0YitVVGxaV3NXWmlDRUU0RHU0ZUlyOHo4RFgweCs5a0dsRi9KVXEzTnFY?=
 =?utf-8?B?VlRTY1hHR2o0enF3QmhWNGRUYVk1VFFZNkdnUmo4SkJra0h1VCtuV3NENmxt?=
 =?utf-8?B?a3JTS1kvN00yaDRSdS9iUkNuWGFGcm5mb2ptSFVmSEZiZmk4SU9QclQ2VG9Z?=
 =?utf-8?B?R0VQejFtU1o4WmVmbVpVK3JQeTNCWWNTZTR2eDFKLzBEeXgwV2s3eldsTXhs?=
 =?utf-8?B?UDFGZkRxS0tRVHY0dnU4UHZoMEtqZ3Fnb3BRTTdUSEw2OFY2NDVpV25pWWh6?=
 =?utf-8?B?SEdCNnlqNXIyY0ZzU29nVjUxU3hLd0s2L3NQNmNsTlQ5UHJpS24yRlIwZTFa?=
 =?utf-8?B?N2MyekM4TVVsVzF6T0p3aHJpWGF5cG9yb3JwTFoycVdDaklBaTJzUVlYTFhX?=
 =?utf-8?B?QXc4TFZEQnlWVENkOHI4WENnVWNhcmhIQlV6bHhlQ01zMG56TWdHdTAyMHBD?=
 =?utf-8?B?UlY3bytZQVhDQ2xocmMzbXZQa0lEQm8zNHBRckIwL0NHRnAxR0Q3UnM5RHNR?=
 =?utf-8?B?aVEzclg5cTRrSEp4NVdYRkU3Vzl0dTJta2c1RlFzTEdHdnA5YXNwekNYRlMw?=
 =?utf-8?B?ZTBjeXBYM2ZIUVlUcFBzTDhWK3BtQUE3RFo4cHVwRkVmUnpFMlJrNVpvRGI0?=
 =?utf-8?B?N0NHdzViTmk2SEt1OVJEc0NkTEplWlNlYlFkOXFxb1ViVjl2QVlhRjBUTW1O?=
 =?utf-8?B?Z05ZQjlrdlB6TllUL2kybmdQelhqU3RDRzVkMHN3T09pQUlTMnFQanZTbVd0?=
 =?utf-8?B?NnBoR0JRZXkwS0tRQXNqWXQwNFdkaW1yaTJVemZaMzZkeTZrQnEwdk5vUXEv?=
 =?utf-8?B?ZmhTTGY0WE03UTM2UEZlOU9sSFlOQndMMlMvUFNTeG9mUUVpS1J2aHk5Rko0?=
 =?utf-8?B?UmhmRmptSk1iakdOc1FmcVFXSVZWOGdmbWdxRU01RmNnT1M2UWYrMWR6U21O?=
 =?utf-8?B?eE1oV0MzNlZyZW5TUEt4c0xaZWY2czlzZVhYWWR0dGNHSldOUkZBaHNIVWFm?=
 =?utf-8?B?NFhxVkxMRExaWnZ5U0pQNkJCZUg2WndkcG1KR2ZzL29TR3Q4RHk4TytXanZK?=
 =?utf-8?B?VERzSXFkTVExZWJGTmw5Vy9rSzJhVlRPdHFubldTUStMNXJwU0w0UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e6219-f937-4776-378e-08de54cfc4db
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 07:20:47.4031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cy/FoIxTsszSOHF3WhOUaPVRkYnKLji6RMwXbibb97SFvwKL2tCWQHTDSvidObTLOMpjjrAxlJrA6UUT4Fur/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C
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



On 2026/1/15 17:20, Akihiko Odaki wrote:
> On 2026/01/15 16:58, Honglei Huang wrote:
>> From: Honglei Huang <honghuan@amd.com>
>>
>> Hello,
>>
>> This series adds virtio-gpu userptr support to enable ROCm native
>> context for compute workloads. The userptr feature allows the host to
>> directly access guest userspace memory without memcpy overhead, which is
>> essential for GPU compute performance.
>>
>> The userptr implementation provides buffer-based zero-copy memory access.
>> This approach pins guest userspace pages and exposes them to the host
>> via scatter-gather tables, enabling efficient compute operations.
> 
> This description looks identical with what 
> VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST does so there should be some 
> explanation how it makes difference.
> 
> I have already pointed out this when reviewing the QEMU patches[1], but 
> I note that here too, since QEMU is just a middleman and this matter is 
> better discussed by Linux and virglrenderer developers.
> 
> [1] https://lore.kernel.org/qemu-devel/35a8add7-da49-4833-9e69- 
> d213f52c771a@amd.com/
> 

Thanks for raising this important point about the distinction between
VIRTGPU_BLOB_FLAG_USE_USERPTR and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST.
I might not have explained it clearly previously.

The key difference is memory ownership and lifecycle:

BLOB_MEM_HOST3D_GUEST:
   - Kernel allocates memory (drm_gem_shmem_create)
   - Userspace accesses via mmap(GEM_BO)
   - Use case: Graphics resources (Vulkan/OpenGL)

BLOB_FLAG_USE_USERPTR:
   - Userspace pre-allocates memory (malloc/mmap)
   - Kernel only get existing pages
   - Use case: Compute workloads (ROCm/CUDA) with large datasets, like
GPU needs load a big model file 10G+, UMD mmap the fd file, then give 
the mmap ptr into userspace then driver do not need a another copy.
But if the shmem is used, the userspace needs copy the file data into a 
shmem mmap ptr there is a copy overhead.

Userptr:

file -> open/mmap -> userspace ptr -> driver

shmem:

user alloc shmem ──→ mmap shmem ──→ shmem userspace ptr -> driver
                                               ↑
                                               │ copy
                                               │
file ──→ open/mmap ──→ file userptr ──────────┘


For compute workloads, this matters significantly:
   Without userptr: malloc(8GB) → alloc GEM BO → memcpy 8GB → compute → 
memcpy 8GB back
   With userptr:    malloc(8GB) → create userptr BO → compute (zero-copy)

The explicit flag serves three purposes:

1. Although both send scatter-gather entries to host. The flag makes the 
intent unambiguous.

2. Ensures consistency between flag and userptr address field.

3. Future HMM support: There is a plan to upgrade userptr implementation 
to use Heterogeneous Memory Management for better GPU coherency and 
dynamic page migration. The flag provides a clean path to future upgrade.

I understand the concern about API complexity. I'll defer to the 
virtio-gpu maintainers for the final decision on whether this design is 
acceptable or if they prefer an alternative approach.

Regards,
Honglei Huang

>>
>> Key features:
>> - Zero-copy memory access between guest userspace and host GPU
>> - Read-only and read-write userptr support
>> - Runtime feature detection via VIRTGPU_PARAM_RESOURCE_USERPTR
>> - ROCm capset support for ROCm stack integration
>> - Proper page lifecycle management with FOLL_LONGTERM pinning
>>
>> Patches overview:
>> 1. Add VIRTIO_GPU_CAPSET_ROCM capability for compute workloads
>> 2. Add virtio-gpu API definitions for userptr blob resources
>> 3. Extend DRM UAPI with comprehensive userptr support
>> 4. Implement core userptr functionality with page management
>> 5. Integrate userptr into blob resource creation and advertise to 
>> userspace
>>
>> Performance: In popular compute benchmarks, this implementation achieves
>> approximately 70% efficiency compared to bare metal OpenCL performance on
>> AMD V2000 hardware, achieves 92% efficiency on AMD W7900 hardware.
>>
>> Testing: Verified with ROCm stack and OpenCL applications in VIRTIO 
>> virtualized
>> environments.
>> - Full OPENCL CTS tests passed on ROCm 5.7.0 in V2000 platform.
>> - Near 70% percentage of OPENCL CTS tests passed on ROCm 7.0 W7900 
>> platform.
>> - most HIP catch tests passed on ROCm 7.0 W7900 platform.
>> - Some AI applications enabled on ROCm 7.0 W7900 platform.
>>
>> V4 changes:
>>      - Renamed VIRTIO_GPU_CAPSET_HSAKMT to VIRTIO_GPU_CAPSET_ROCM
>>      - Remove userptr feature probing cause it can reuse the guest
>>        blob resource code path, reduce patch count from 6 to 5
>>      - Updated corresponding commit messages
>>      - Consolidated userptr feature detection in final patch
>>      - Update corresponding cover letter content
>>
>> V3 changes:
>>      - Split into focused patches for easier review
>>      - Removed complex interval tree userptr management
>>      - Simplified resource creation without deduplication
>>      - Added VIRTGPU_PARAM_RESOURCE_USERPTR for feature detection
>>      - Improved UAPI documentation and error handling
>>      - Enhanced code quality with proper cleanup paths
>>      - Removed MMU notifier dependencies for simplicity
>>      - Fixed resource lifecycle management issues
>>
>> V2: - Split add HSAKMT context and blob userptr resource to two patches.
>>      - Remove MMU notifier related patches, cause use not moveable 
>> user space
>>        memory with MMU notifier is not a good idea.
>>      - Remove HSAKMT context check when create context, let all the 
>> context
>>        support the userptr feature.
>>      - Remove MMU notifier related content in cover letter.
>>      - Add more comments  for patch 6 in cover letter.
>>
>> Honglei Huang (5):
>>    drm/virtio-gpu: Add VIRTIO_GPU_CAPSET_ROCM capability
>>    virtio-gpu api: add blob userptr resource
>>    drm/virtgpu api: add blob userptr resource
>>    drm/virtio: implement userptr support for zero-copy memory access
>>    drm/virtio: advertise base userptr feature to userspace
>>
>>   drivers/gpu/drm/virtio/Makefile          |   3 +-
>>   drivers/gpu/drm/virtio/virtgpu_drv.h     |  33 ++++
>>   drivers/gpu/drm/virtio/virtgpu_ioctl.c   |   9 +-
>>   drivers/gpu/drm/virtio/virtgpu_object.c  |   6 +
>>   drivers/gpu/drm/virtio/virtgpu_userptr.c | 231 +++++++++++++++++++++++
>>   include/uapi/drm/virtgpu_drm.h           |   9 +
>>   include/uapi/linux/virtio_gpu.h          |   7 +
>>   7 files changed, 295 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/virtio/virtgpu_userptr.c
>>
> 

