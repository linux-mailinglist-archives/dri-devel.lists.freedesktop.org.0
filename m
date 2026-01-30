Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBeyFRfqfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC38BD18B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6E10EA18;
	Fri, 30 Jan 2026 17:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Nlt55BQa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C54B10EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccrNL/qmtkWnF/VNv+KCGQuXQHHVWKFjeYI2VozvkI0BQx16KhfG3W0RbEX8Yg1hnxZ54wy3h5zzbCD1TOsV26jHUnfPQozLhnDnbKkp21aAGj2r41lgQrD18QX8i/CO+jGoL7ck5uUZUJhfN/pkY9SdmxE0hZ4BIU+SJStWZ5jigqjhjiuEA+Q/vVeBiTOeMEFQAIKKROFfGPytQ6/WcYDQnN4paaWeIMGDwNqrQ1TWUrimFnTI9X37ZKqk60ChFMI6TBbM/oPtXRY6TzDT+COlAMBXKChbwWZhUFilUUoAXjzNnG1silP3MSvZkCi+o5+Wuy4aahHqkxr79kEzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wi26g5oQX0Rd6QPkdvlRe4EYgd1T7eDg/c1s5N4q7M=;
 b=tyAZdxca9zP/VdyTKtayVXcNkTUY/gbfNRsPds2HbN7J6694sxVa7EWQwZfNy5kvDmKFB84BeHgX2FZa43i6V7rK6eTOJmN9FqhW5TPPLoDdId22Hm0eUF2HuWL691CuR2CehOo5U5myr6uUNUcCcTtC/IDXh8Wq4FJE64C1vxk8BinhzEk/ArNhPXQJuORNUOnCC5yuOb9kM50QbMmM0zXZbd+nZVVlpPDi6/G+3qtdfAwxTPc99rfT2tbywXHWyBA54gw1nSrtux5JLQ+N8opAnme2KI6qtvbuTzdQTUHpU1HkBv7YFv0vUG0TS1q0zuwVeOuwegrFnyoWj4aQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wi26g5oQX0Rd6QPkdvlRe4EYgd1T7eDg/c1s5N4q7M=;
 b=Nlt55BQaRUGPkeme6nxhxbv1fXU3oCLrKqMjvHK/tQsPIiWYGIGq2ezl/gpnm6oo8UqtOxB5N4sNl+EbLyZfIK2My+89cHOwPA7xEy2kfnXFAe6MX97E21deYrD/Xwii3HB6CSE0GsuFrndjglEJ2AVDuM5TalIYN6k9YcNJr3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:45 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:45 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 13/20] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Fri, 30 Jan 2026 18:25:10 +0100
Message-ID: <fa66ab8fe38d574c02fbf45b212ffa406fc334fd.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: ba84571a-ef7a-4642-37a9-08de6024e16c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pquu3L/s5LWpn1RaVy3XUCvcNVfSjG7+i2HsPGwzq5sYyafOclgAcokKjwQa?=
 =?us-ascii?Q?XVmZzNyKYYB4+ZA1U/3wpg8+O791Nfyce9EWEDXgEc4zzA6opLq4lsll3Lic?=
 =?us-ascii?Q?DH3KsxfTUI3QXpzQj85SXEMRuF6rAIJPKVz8R7E0WUDlU/bxr6uPViokG6gD?=
 =?us-ascii?Q?iYiup/jsitP8C4+HRIy2cOBEhr9nXb4DnOCfemxXlA2WQ/Va7CDJ38njC8Rn?=
 =?us-ascii?Q?LXb7vZIWiU0CocC5SoZMB/qeAHcTNUeMp0lPhNIFjjtwmYBEWzVOw/w6vuOU?=
 =?us-ascii?Q?5xe9guougj96neeoeUn19QUbkoRTNStxrtKWgpBayGpjckiIjWu4F8M7igEJ?=
 =?us-ascii?Q?8cy7UJljBSRcxl9WXPEBcmCBXgBaqplWKLtwAYcnf4mP6NzmoXnNebOJRPIT?=
 =?us-ascii?Q?sDYXde5GKMJVN1djNKqs/derU5In8iVStY8s97ti8PMDIWh/v8UQHZRideX2?=
 =?us-ascii?Q?8CEn5wkAghhxn4F1IfWtm3ZFO+iE2hKVHxUIhEovQtbpQSIbMtp+cPbv/I7A?=
 =?us-ascii?Q?UkCUxS+X9mopJdvE5R0MYnxm+4BsrECFTmV9XY6it2kRysbOyG8tdKZgzhEJ?=
 =?us-ascii?Q?+4O9iNSBF+9OuCAIEcWcDZOhWr+g5b6qEi4X9RLMUrlOCT71JEOGM+vAyJUJ?=
 =?us-ascii?Q?uzsQrvd7WJww4ImW19Cuwi9i+3xmuq2r1VbUixTGPVFHIcYVXelDl8XNBCss?=
 =?us-ascii?Q?rklwf0+umMyryk4OwFBhwlWDGduS/ypr3tLU4XV7aUTrmZgbuyJ98VHxP/eZ?=
 =?us-ascii?Q?bfF+cJb24/AiFAF2acuHrYbBfEj5yg3YoMQ8TiVEBFDjVjZ6+ihv4KDwjicy?=
 =?us-ascii?Q?56QIEOle/FP0SlTjeK36H2DW0wGLlQJ0T81ebPX3pWB9VmMoPXIZ/JLB2KWd?=
 =?us-ascii?Q?Nt+UXIFVlQoRBNJkYfvOF23WlKTPaFYQPdv/M22uj1tMy7NUct3a8ZHXxo7V?=
 =?us-ascii?Q?0asmx9BnonKKhEEUL57UK/WiwngsF1oIMQXOkDsHKcCvmwQJO6fQ8kw1snDN?=
 =?us-ascii?Q?oAJioLKH/ZmDTKmp0UdTGH8NJjVtMYQJVpWUNmebc7P0U3fx7uhOAo9fpWi5?=
 =?us-ascii?Q?aFI8XzLBV1F5A+ihnnsjdTnT40NHCC9LiojPoVYm5iZb2abuIqGkfczXrOAV?=
 =?us-ascii?Q?U3f+zr9iDzfW28AC2ZkAGiSVFP0lX2nd2VEQvIAWSYvkDKlHJZC4cEnl7LW8?=
 =?us-ascii?Q?tgM6Bllz7MZgfNT6NodSqDSLfp2AwCtTE+I9Y8mQMSj/Xn1rBT5V14u+kgGP?=
 =?us-ascii?Q?C51fO5wUd5i+ymSo28oD+h+OO+DOOuFXVzA1V3ce4SBAHGXA8K8pqkhXNPCJ?=
 =?us-ascii?Q?bTz+INONi7IxWbV7ZoiLO9wZfiHM2/nt2qSVaKxvvQF5KhQHK/YWm8267DYC?=
 =?us-ascii?Q?4gIqdCOHkheo9rbAMFoT4DcbqVr+Cxqh/SSeHhlEYTtiTWbDWzvF3mMkN+/8?=
 =?us-ascii?Q?+3PYZDSs2qbDjnPnfE7yBtRPU+VmVSGF8Qv0c1OiTRauLOjuQeD1A+FPvw00?=
 =?us-ascii?Q?gHcX/bOgEf2pUqlSjkJxHfHS0rl3pRbJ+iegbXVpxaMlBM2jzchiUQfz8VPo?=
 =?us-ascii?Q?B1yBthNAkgFA2rY1aCEfSYXdCaIT0IFzN/Cwm75ZfXM6iadnFSUAo69cKdVa?=
 =?us-ascii?Q?QuScHcPTeD186IKgNEorKa4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTuISCP5UyTPe6C0cjUdPUQXVldDj89IYrf1EEAMR08ezV1qN79EKGd3FMQk?=
 =?us-ascii?Q?k3oxNyknmqkdY0ezkAE3hwh2z0glJ/sCPaUwcnNoYhYuqgMcL8UO0I0qJ+s8?=
 =?us-ascii?Q?L0yD91lNXD0ixys4Ar2fIiMNxOqOJ4Gk1ubQrNGJg846ZL4kJPb655BCP957?=
 =?us-ascii?Q?zJlwZaV57G3gZrdgCyq7jn/5uwvIp9jtic9+h9eN/OvHy7k7+ZkETHT2YBcL?=
 =?us-ascii?Q?vhZp+jkFB8VdR66GibQfnLhEQoncqglqDzw98UU1r+E0v4jnYybkTqxcbY/1?=
 =?us-ascii?Q?VnYSTv1CL9+AH+VONEzM2Hz6Icv03lTBSCV4h8RbNatvV7i+fWytpz3kIXuI?=
 =?us-ascii?Q?/Zv0Q3v++YirBFTaflxKHu0vdlXhCzYLFBa+lKvoTSXOMxuOp8mbb9pCa2pA?=
 =?us-ascii?Q?X18OP+DZdw5MqUkpQnGuKVjxz4b9bf6MDYSojGVfyA4ScX0ZVA9zaFUHlidk?=
 =?us-ascii?Q?4EF7ZCP4XeJWJon2J9omYf9iaDUfmuC1wPKLVNJyncLpp/oB2+aBlGI2o1WV?=
 =?us-ascii?Q?0+E+epNPWUcZSxYstf8GaSB4Na8nfq7zyNPyqIU3iufPLRqwNdZWWkumgY/p?=
 =?us-ascii?Q?NKTJorn8Bxk1E2yp4FB3FyGhtyNQBr84d+24O8U5vinE7mfqlXkccZ/WPsgj?=
 =?us-ascii?Q?3Q8N3wvf38T7fZi8MsLpqI8+QYQuhmnhbFk6ZYhHtYSAjTZkx21cuOdQ2KC1?=
 =?us-ascii?Q?KGmOTpEzKTceoF86u5I0Y9F+Cz7p8MpLo230zaHCoPigU95bNxqTxZHx4PJ8?=
 =?us-ascii?Q?U58A/1QL8wl8HxjmzIWdunLiEPk/OHlebhfNJVVT9mca2ORlFJwyh0BHGHKZ?=
 =?us-ascii?Q?fTL0/mnai996ibN1a8pad1+5rMQdj+UMB8x4HCdSbyLN2fj+7DMrLBeBw1uS?=
 =?us-ascii?Q?/9473OrdDM8elavgE6a6OYEKEEJIB88sSxQhfOqahTkoKoljy/C0RD/9pkA3?=
 =?us-ascii?Q?f8zjurEwRqjEwya61gyGdQE+ELSlYHexZeFA+Ws6kSghXkclZoXN05dtI0Hq?=
 =?us-ascii?Q?MH6MpAFj4zPiRETJrOcvNEKe2EbvmkV2RRI48SDyvW5H1UvYti8HTz0ag34G?=
 =?us-ascii?Q?iXQmSYYAN6SGiWzt0Q+VQaswT912FskTwoWAMyDIV3xaSFSq7DyuU5dBugBc?=
 =?us-ascii?Q?AY8o60TP/x+AeCWkarKgacX6epuvHHrf8u+OBP0Fa3ORYwsELunnI6lup/3L?=
 =?us-ascii?Q?O7404icKtk8VLMH6WE0V6zeGPDIc6LmrrUZdh4HBcXvjX0yXUuytxIA1t+od?=
 =?us-ascii?Q?KHvDpjmNueIrCITvo1jz8hTW82EkSos2ElsCreHYnZPRAsEtil7+0giaZyzy?=
 =?us-ascii?Q?ECwLB0NbOSvhEyJR2Pe5/VJ0Vy2QHs3pWmbHL2bIwApSNc7VC05Jfc/P6Rix?=
 =?us-ascii?Q?yoPVQ3F0wBqi/ulFtBAvtioARWqRJQ4N7GkZzxLjYLWIPwfapIgm+j2TF/om?=
 =?us-ascii?Q?7mbhweEbQL+eGqcNWYz0m8kFVWQbQxPZEBJhiPEE2Dj9M55RUX6niTV59nkN?=
 =?us-ascii?Q?OnEdLWKYJOwpC5KV+G7JwYwDpvULYBpq44L2vZOzS5DGSGZ/ySJGD4Ibfxdg?=
 =?us-ascii?Q?zKA0UVxKcz7L3M7kc5/11L/hWLumVOYa9YemZAJnv7ja03AXviqsQ0PWLCPP?=
 =?us-ascii?Q?fE7jxGLHmq/20aaft8mO6tPayp/USEqrMdfUfXnaClHmZkiK0I8CKkLgHRL/?=
 =?us-ascii?Q?UGh0ih8//Mj6zr2PUAb0qH1CRSDa/Uq/eWq/RUJ2nEp/Sy9Oaks5QtjX3K9u?=
 =?us-ascii?Q?TCjjJE0SZGnUxq1PjKZ7JJJmiWLfKJnbmkr56rkykqL+uVde72e4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba84571a-ef7a-4642-37a9-08de6024e16c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:45.3372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3T3VokzqBfYW8pJ6+UaLFtGeIs0chNOGwJsQLmNJsTmaf/fyd4itqVH0b456nawWnuUo7wlF5m0qATGUy/mrTMZLFhB16UgwMUzzChHGinElqQ5Xoefq4LbOCLf6PXDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: BAC38BD18B
X-Rspamd-Action: no action

Add MIPI DSI support for the Renesas RZ/G3E SoC.

RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the
DSI PHY perspective, so both can reuse the existing
rzv2h_plldsi_div_limits structure. However, at the CPG level the limits
differ:

 - PLLDSI0 limits apply when vclk1 is used.
 - PLLDSI1 limits apply when vclk2 is used.

To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.

During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected
dynamically based on vclk_idx, which reflects the currently selected
vclk.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 35de1a964dc0..27901dafab9a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -590,7 +590,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
 	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
 					&cpg_dsi_parameters,
 					dsi->info->cpg_plldsi.table,
 					dsi->info->cpg_plldsi.table_size,
@@ -1539,6 +1539,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] = {
+	&rzg3e_cpg_pll_dsi0_limits,
+	&rzg3e_cpg_pll_dsi1_limits,
+};
+
+static const u8 rzg3e_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16,
+};
+
+static struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzg3e_plldsis_limits,
+	.cpg_plldsi.table = rzg3e_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzg3e_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.out_port = 2,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_GPO0R,
+};
+
 RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
 
 static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
@@ -1577,6 +1607,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-mipi-dsi", .data = &rzg3e_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0

