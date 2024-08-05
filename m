Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938149473CD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 05:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9A110E10C;
	Mon,  5 Aug 2024 03:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZqBm8oiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEA010E10C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 03:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQcf9oJKHAh35ufL4Q2vsEoc1LsdyjC0l09bLT24s7obUDEvbRREa+FgOJYEU3h8/2exoIbHGc4wCh1oIZQFY06nOoed2VkpovJ7LC9x2XhfR1VzjG8GGppcPxmLkl/EymN6GqVyMedev+LolrppRWccXOqiXyzklNJL9R+0V8cSP5Ts7DMltNTFLjSNHgVsFBWqLWLORz4Nmoiec/z+hgwYcsbNeGcY09++JdKiIo/TRrS3qFhNnIBcR+clCVcUubtGm1GHh0TixazGxOrYxMfuAUe/2CcDyKf2I3QxtoBJ5Esve0LSnHvdjMSo7an+e8dTZ6Pl70cbpZ0By4RxwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/OsJmtBLjtZ+fJv/A4I7IiiM4h/iA9KghkikKV3ma4=;
 b=lzvFvsMrY/ZaqhiT/n5wN3Lrw6nFatczm/WKE5ugi8lgd46TZBRDa/imdM3LtkwmgQ23YsnzNA4fOSsZYkWWFjBvov4DjPBDKyhCbmCyXfAB9J3aO5kvSOpbRUah1KEykIvGh+BWtzVPDNG+kaqBDcDbc5Dz5Gm6/wZIH9PIv5DO3SckIYNdVJuFIUYjhp5U55LB/JovwuuaXl3SeOb65fbDKj40wCLrC+M00byqANcT9asoc8dfoL0qFCmSWb6eYE28iQoJj+tC7XfJFEw/Nu4uyC+BEAUDURTBJCHswPEu4bE8NVPq/cbKw7x/P7+QqxdYqjqgRbDI8KmkgYXwhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/OsJmtBLjtZ+fJv/A4I7IiiM4h/iA9KghkikKV3ma4=;
 b=ZqBm8oiAzrEGDFskaM/ad6PZMUB1eLOjeeVFyU1BPrGKcLGcfw4ChReJFSC3ft0YPv+1XbPzfBRo0vBcwryRSF8Q9uAGaWLH46fvbRthQJgzjZwO+6S4dmnN2UH9z+P43lWfPGePnv1p4tnMYB7v2GulyIzTFrr+5JtCLD72+BZ0Jz7N8t8A7g7mle/4A7cXc7mTVptcyBl1pM48FpAS9RZ+U/MW2wcX8wxwrtcIBmr9K0XWMUsPBmRrYbC/okFTP5G1x7pvp+2BNgpapPrcSyNwtBk2m5KQdMd37PkwTh3YooZRPmDkx61h5qNthRHc42Cr3DXC6K7BUqDBSVtyiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8611.eurprd04.prod.outlook.com (2603:10a6:20b:426::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 03:23:31 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 03:23:31 +0000
Message-ID: <677a5492-8f88-4ad6-8652-278d24b1b8a1@nxp.com>
Date: Mon, 5 Aug 2024 11:23:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-7-victor.liu@nxp.com>
 <ib6brwxeai3wkgzglihfbqx7jakjslnftydbzo32xthijkd4u6@y4ebhgk5o3ec>
 <8071fdf8-6813-4707-8a9c-ad24f8b6a32f@nxp.com>
 <vlnpy7abizzzh7sj5zrgakwyams3w6k7ee4kaagiw646atmnjf@xkimtr43d4hr>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <vlnpy7abizzzh7sj5zrgakwyams3w6k7ee4kaagiw646atmnjf@xkimtr43d4hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d417626-a066-4198-52b8-08dcb4fdfb0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkRJQ2QvU09aRElTVzFZOXA5NC81OGRON1Z1MnZxWmc1L0NWWk1xZzl5Vk5m?=
 =?utf-8?B?TlFzRFNpbXU3eG1KWGU1TnowU2h1Z3E5Vy93YzJlRzdzYzhnQUR5bnNOL1BN?=
 =?utf-8?B?Umx4UFE2Z1F6SGN2KzVJYzJGTENqTFdZbUprbGVtUGlvTXNlK3owVkxITnBD?=
 =?utf-8?B?STRuZTRkd3lpaVVHK3oyNHdrdEdhcTk2aEl4azRKTlcwZ3QxVVQyQllwK1hD?=
 =?utf-8?B?bVBxTzR3S3RDMjVOVVRmc0ZkOXJpNlMvMlhucjRNU3pVeVR5QXlaTnVObmZm?=
 =?utf-8?B?ODNSS0NtSDVaQ05reXo1U3FTYU5adWZNQitUcW9BNTNNNXRKbnBYUlV6UUZU?=
 =?utf-8?B?UndoSmRCOHdnTk1iOXJjTWRzVGozcE04ek5OMEVJVEVsRFhMUmp3TUNMaEVa?=
 =?utf-8?B?VjRZS0YvTUxsU0RsZVhhdXlvNEZEVGNMMkpWd3V1Tmt0a2FMTXJWcTlvRXc0?=
 =?utf-8?B?dlZ3WGNqdktsZ0o2Tkg4Q21ZUDI3UjZvMlltS1V0eWFzWHFwWjVNbFg4UzQy?=
 =?utf-8?B?b01zNGZTUEVRVDUyNjljVGtDelpSYTNJa2ZPZGRXL1NrNzIzaDhjMlhOSWFJ?=
 =?utf-8?B?Q05xY2Y4UHNkd3FueS9ZRWp4N25DajFqVzloK0FaNUtKVUFMNWxxQWRlaDNw?=
 =?utf-8?B?emkyMHhKSlUrblZZZDMwR2RtZHNFOTN3YnRiZVY2c3RrYmM4TnhMQVh3R3cw?=
 =?utf-8?B?Qk9ETXpDYVZPN2JJRFlSd0gzQWkzbUkyODVtL2Q1MVJiVWUxUThlcG9laDcw?=
 =?utf-8?B?b1ExWjZnZ3dLa2x1ZnhwZVB3K3VSbGxIbkxYMjArcmlyMmhGRk5zUTY2T2E5?=
 =?utf-8?B?a1JlNndRNndoM3Y1TGY5TzRnUlhjMjZyTEQ4NmdDZ1k5QTlxRlVUbkdjMVJt?=
 =?utf-8?B?N0hObnpUODQ1T0pTUlA0djhZWnhsQTRzZENFYk1LS25pNDdBSG9qeVpDV05S?=
 =?utf-8?B?c2Zod0w1VTkycnVoLzR6OE5Wb0lvQ2NEYUJ3ODgxa0MvdUp4S2kzOXBERTVu?=
 =?utf-8?B?L0NEc2hrNW5hclovQTZtQjU4T3EwS1B5VFpOelhsWlZYVXJxRDNkeVpFaDV2?=
 =?utf-8?B?aHUydTBaWE4rRi9sSWtMY0tjamNDQkdqR2JVdFlZMEQwSERoY0MrRTNhbHNx?=
 =?utf-8?B?U1ZTUlNOTTR2NkNhY0piMGNZMm9PZFczZk1JQ2oxYUpMZEduVXNnTktBQmw5?=
 =?utf-8?B?Tm9XajdaVCtuaDdIbnFLWXF6eFpXbDA0aFU1VXFvMlBIanBUQWxjN2VRTFJ5?=
 =?utf-8?B?d0h4cG1OSi94ZkxPYzlmTFB1YzlKcUszZnpKQXlqdHVNK25PTkorWHlMWUdR?=
 =?utf-8?B?SVBIYkNlYmdDTTR2dExDdExYVkRjbWVNQUxzem9tNE8rQzRNZytBV2RYNXhm?=
 =?utf-8?B?d3hWSllvRUd1ZW1idWhTYThuQTI5Y2ExclhJVFFkRWFSNWJSekptVXQzNmli?=
 =?utf-8?B?aWsxcFhZekE2L21ISlA4UnB5dFRhWEorQ2h5bHczbHBGT3FhSGUwNDF4RERw?=
 =?utf-8?B?ZDdkcnNZOU03ZVVxZ2Z3ck5kUThvbGRjM2YvejZ0MmJmVTZqYkJBa21jQXpy?=
 =?utf-8?B?elVicTMwZElmRE1NNHhqRDIvUEc3K1kxUUEzTFhzaE1ST0crc2NldlA5K3dI?=
 =?utf-8?B?YXB4UmlFL0xuOThhNXYwVTRGdU9laEVzTnpqQU1xd1VxOFk3S2lzSmltdUNS?=
 =?utf-8?B?SEtHbVAveExEK1VZdmlzUmdMYjR5Zlg3RzltdVQ5NUQrcHRlaVRNQ3BjZ28r?=
 =?utf-8?B?anJzUVVrVnJqclRHTXRFeXd0K3JEWlcwNHhaeWJWQkdBVW4zTXlxaTZDcUQ4?=
 =?utf-8?B?ZFdBMWR0UFB5WlZ1ZFVSdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTJjbnFtL2tJd21tcjZoc3lTR0pJYll4Rk5lMWZpMG0rRDVhcTBJQ3pFOEVt?=
 =?utf-8?B?VkN4Rno5Y2tqNFFjcUMwNzdEb3JUVFRDNDFFcWJZaE1pWXJXVCtmQkVQQ1pO?=
 =?utf-8?B?TTN0amxieVpSY1ZadFNDQW9EbVVhUXQrVVJKS0RmQUE3bUxleklrNnUvNlk1?=
 =?utf-8?B?VmNkek8rNFduOXF6N0kxWXBqY2gwSm9hYmo5U3FCWHEwZFFhY3B6bGdpanVr?=
 =?utf-8?B?Z0NWTFZ5YzhOeVBXUVRCK1gvSEYzMVBVdGRuMmhYQlRwVnJadkZISDhIdGQ3?=
 =?utf-8?B?bS9YRE90MFBJSHdFNWl0OXdmc2FKOVQwNzFUdmh6ek1VUUJ4Z2IzOFNCckRL?=
 =?utf-8?B?azFtbHhOdTNSMFhORXJ4RHRTM21qL1E4Vm9DK3hNblllRGQwWEFDaVNBWUhR?=
 =?utf-8?B?a2dDNEdzc2plaGlTVkRFMUlFc09yL3BKWEVaU1ZSVkV5STlpd2I2MG5OUjRu?=
 =?utf-8?B?TnI4UHo0UUxPK09YdEtXbjFWTHVsWTZWWVpyRG1GNUliT2RiTG45UDRLYjMr?=
 =?utf-8?B?UjRvVS9NY1FpWVpOZXB1dGREZXladmt0VllJZmNrVnJ4YlAxY3NEUms3QzhY?=
 =?utf-8?B?M1lQbzl0dVNOYkNLbzRFbUFsaHRQSVpHd1I2ZStqMTdoM2xQZW9ISmYvT2hu?=
 =?utf-8?B?eTFKSHUzWFdVUU85b1V6ZFExQ202bTUxOVByc05ydEFKN2FBM0xtbThqako3?=
 =?utf-8?B?TXZjeWptMkxrZFVQSUVoVWErM2FpSkxaRTdGazVIWEZWRzI3STNFczAzTHZl?=
 =?utf-8?B?VTJKbVYxcWtGUW1SOS9lZ2lyTGxxejU2M0JyWFBjWjZoc1AwcW1vcmFaZlNG?=
 =?utf-8?B?QlpWeHpxR2JRc0REWitnODBiQWZzOVpaczFPMVFRWnpMR1lmZy9tM0ptdFF5?=
 =?utf-8?B?eHpXTy9Jd3BxbVd3OEI1Z3E4dUtLYVNoYi9DUzZOcXJuTUpFLzZjT01MRU13?=
 =?utf-8?B?SGt1MDdZMlp3dVhUOTBOQVJ2YU5IdXhxYS9nZnpzblk3ZmIvSzRBMXVsTHMy?=
 =?utf-8?B?K0tibk5TYmluZWNZTnVKNTl4ckJuS1M2RUJuaHNsRE1IUnhqTnlqUVA1VTdv?=
 =?utf-8?B?TFVtVHg4MG9ySmYvQy9EVTdBTjlCOGJFMHBDVll0RnllcTF3WmNQM0tzVWMz?=
 =?utf-8?B?VlM5bVNJNUtiNlN1SFBEanZBdEpJaTNqY3pKSElPRFQxNElnd1IxbDdacGhJ?=
 =?utf-8?B?Z004WDA5TGRKMWJqb0ZBUmxlRy9ESHVmQXVUV3NOZFdvcjRzdjFCRHllczVx?=
 =?utf-8?B?MWYxQXd2dE56Q3JEbDQ5SUhvbmo0WkFVYmNFczlkbDEyQkJaS1YvK2hETkNk?=
 =?utf-8?B?QldiZUZlQzlqS3MxR3VnQVVQZkRmVmh3Wkc4bEphcy96KzdNVGo5SUJxaVVS?=
 =?utf-8?B?Zks4cDM1TTNkR20zeEZqRXJFQ3lXNEhBMWRJYWo0SUdlNFVpRzlHa0lDKzJr?=
 =?utf-8?B?Wks3QmVQeFVHeG0yQnI4Q245Qi9RM0N0VEpOSEJmbS8xdHpGYlZVRm5aaDlM?=
 =?utf-8?B?Ni9IOW5qdzV4MngvSkJBQWVmVjdnY2hveVBvb0F1RExlanBZQkRwdGwvNjlT?=
 =?utf-8?B?Ynlwdk94ZVMzTkl4bmdGUXVzTnpQZXFlK1VmeGRPMVFjdTlVWTJKdXcrbzVl?=
 =?utf-8?B?cTRVVmtnS29tQVNOTlp0Sll1TjRHNStBQS9NbFBiMUJobmxBOXg4c1pmazk0?=
 =?utf-8?B?ck9pUHVzYlM2b2p5UTRzNzZTd2tPWm0wTFNPTHUwcWNhOWZ4aUR1bmVJSzZD?=
 =?utf-8?B?MDVWWjIvVndOdVhJOTA5Tm1qYUVsMDRuc3VQbUVDanluemYwTGZsN0FFSjA4?=
 =?utf-8?B?YmI1QTFKcStSTENxeE1qVGg1NDN3RG1naU1wTFdySzRldTBhZjNDdDA1QUxV?=
 =?utf-8?B?ejJraHBIMGkxV1d4Y1FFZ1p4N2w3TUNQdnVLOHRuelJhazZoc1NBWThQYWpO?=
 =?utf-8?B?cEdNNDlSTmlaTDdkSXc1QWdIVDU1QVNxOGhpblRMMEhkTFpyNnFjUGZ1QXo0?=
 =?utf-8?B?VkZ1YldEYXRqMjUwLy9XRDNKbDAraEhZaTJBdHM1V0h1QVE1bDdBdTY3bGwr?=
 =?utf-8?B?K2MrSnYrMHBNb0hveDFYVFhhMko0TWVhMUxGRWw4aGd1bFB6ZlVPYVRZeTFZ?=
 =?utf-8?Q?xY5zKa7olSnuxF+AOwkjNrvhH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d417626-a066-4198-52b8-08dcb4fdfb0c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 03:23:31.2426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lbIg25fA5+PAAQhhtJnuK4fjyL4ZpkjwdcUIQxpT/8B2SkhajQ4xCAbUAGUCp9Eeb7HpnuIXLbC7L03ZS1jjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8611
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

On 07/31/2024, Dmitry Baryshkov wrote:
> On Tue, Jul 30, 2024 at 02:25:41PM GMT, Liu Ying wrote:
>> On 07/28/2024, Dmitry Baryshkov wrote:
>>> On Fri, Jul 12, 2024 at 05:32:33PM GMT, Liu Ying wrote:
>>>> i.MX8qxp Display Controller display engine consists of all processing
>>>> units that operate in a display clock domain.  Add minimal feature
>>>> support with FrameGen and TCon so that the engine can output display
>>>> timings.  The display engine driver as a master binds FrameGen and
>>>> TCon drivers as components.  While at it, the display engine driver
>>>> is a component to be bound with the upcoming DRM driver.
>>>
>>> Generic question: why do you need so many small subdrivers? Are they
>>
>> As we model processing units, interrupt controller, display engine
>> and pixel engine as devices, relevant drivers are created to bind
>> them.
>>
>> Maxime insisted on splitting the main display controller(the overall
>> IP) into separate devices.  Also, Rob asked me to document every
>> processing units and the other sub-devices in v2.  So, splitting the
>> controller is kinda accepted from both DT PoV and DRM PoV.
> 
> I went back to the previous series, where Maxime commented on the
> "multiple devices glued together". With the split architecture it
> becomes even more strange, because now you have a separate IRQ
> controller which enumerates interrupts for all subdevices and then glues
> them back.
> 
> If it was an actually split device, I'd have expected that each of
> subdevices has interrupts going to the external controller, without the
> glue controller. Or that the glue controller has a limited set of the
> externally-generated interrupts that it further splits into per-block
> IRQs.

People may have different opinions on whether the main display controller
should be split into sub-devices or not, or even how it should be split,
which looks quite subjective.  Given this situation, I tend to follow
the kind of agreement reached by Rob and Maxime that it should be split
entirely and each processing unit should have a dt-binding doc.

> 
> Could you please point out the patches that describe and implement the
> <&dc0_irqsteer> device?

drivers/irqchip/irq-imx-irqsteer.c
Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml

You may find an irqsteer DT node in patch 13/16 in v2.

> 
>>
>>> used to represent the flexibility of the pipeline? Can you instantiate
>>
>> No. They are just used to bind the devices created from DT.
>>
>>> these units directly from the de(?) driver and reference created
>>> structures without the need to create subdevices?
>>
>> Given the separated devices created from DT, I can't.
> 
> I'd allow Maxime to override me here, but I think that subblocks should
> not be described in DT, unless that is required to describe
> possible versatility in the display pipeline.
> 
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v2:
>>>> * Use OF alias id to get instance id.
>>>> * Add dev member to struct dc_tc.
>>>>
>>>>  drivers/gpu/drm/imx/Kconfig     |   1 +
>>>>  drivers/gpu/drm/imx/Makefile    |   1 +
>>>>  drivers/gpu/drm/imx/dc/Kconfig  |   5 +
>>>>  drivers/gpu/drm/imx/dc/Makefile |   5 +
>>>>  drivers/gpu/drm/imx/dc/dc-de.c  | 151 +++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-de.h  |  62 ++++++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.c |  32 +++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.h |  24 +++
>>>>  drivers/gpu/drm/imx/dc/dc-fg.c  | 366 ++++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-tc.c  | 137 ++++++++++++
>>>>  10 files changed, 784 insertions(+)
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>>>
>>>> diff --git a/drivers/gpu/drm/imx/Kconfig b/drivers/gpu/drm/imx/Kconfig
>>>> index 03535a15dd8f..3e8c6edbc17c 100644
>>>> --- a/drivers/gpu/drm/imx/Kconfig
>>>> +++ b/drivers/gpu/drm/imx/Kconfig
>>>> @@ -1,5 +1,6 @@
>>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>>  
>>>> +source "drivers/gpu/drm/imx/dc/Kconfig"
>>>>  source "drivers/gpu/drm/imx/dcss/Kconfig"
>>>>  source "drivers/gpu/drm/imx/ipuv3/Kconfig"
>>>>  source "drivers/gpu/drm/imx/lcdc/Kconfig"
>>>> diff --git a/drivers/gpu/drm/imx/Makefile b/drivers/gpu/drm/imx/Makefile
>>>> index 86f38e7c7422..c7b317640d71 100644
>>>> --- a/drivers/gpu/drm/imx/Makefile
>>>> +++ b/drivers/gpu/drm/imx/Makefile
>>>> @@ -1,5 +1,6 @@
>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>  
>>>> +obj-$(CONFIG_DRM_IMX8_DC) += dc/
>>>>  obj-$(CONFIG_DRM_IMX_DCSS) += dcss/
>>>>  obj-$(CONFIG_DRM_IMX) += ipuv3/
>>>>  obj-$(CONFIG_DRM_IMX_LCDC) += lcdc/
>>>> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..32d7471c49d0
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>> @@ -0,0 +1,5 @@
>>>> +config DRM_IMX8_DC
>>>> +	tristate "Freescale i.MX8 Display Controller Graphics"
>>>> +	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>> +	help
>>>> +	  enable Freescale i.MX8 Display Controller(DC) graphics support
>>>> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
>>>> new file mode 100644
>>>> index 000000000000..56de82d53d4d
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/Makefile
>>>> @@ -0,0 +1,5 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +imx8-dc-drm-objs := dc-de.o dc-drv.o dc-fg.o dc-tc.o
>>>> +
>>>> +obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-de.c b/drivers/gpu/drm/imx/dc/dc-de.c
>>>> new file mode 100644
>>>> index 000000000000..2c8268b76b08
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/dc-de.c
>>>> @@ -0,0 +1,151 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#include <linux/component.h>
>>>> +#include <linux/container_of.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/mod_devicetable.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of.h>
>>>> +#include <linux/of_platform.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/pm.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +
>>>> +#include <drm/drm_managed.h>
>>>> +
>>>> +#include "dc-de.h"
>>>> +#include "dc-drv.h"
>>>> +
>>>> +#define POLARITYCTRL		0xc
>>>> +#define  POLEN_HIGH		BIT(2)
>>>> +
>>>> +struct dc_de_priv {
>>>> +	struct dc_de engine;
>>>> +	void __iomem *reg_top;
>>>> +};
>>>> +
>>>> +static inline struct dc_de_priv *to_de_priv(struct dc_de *de)
>>>> +{
>>>> +	return container_of(de, struct dc_de_priv, engine);
>>>> +}
>>>> +
>>>> +static inline void
>>>> +dc_dec_write(struct dc_de *de, unsigned int offset, u32 value)
>>>> +{
>>>> +	struct dc_de_priv *priv = to_de_priv(de);
>>>> +
>>>> +	writel(value, priv->reg_top + offset);
>>>
>>> Is there a point in this wrapper? Can you call writel directly? This
>>
>> At least, it helps finding read/write ops upon interested devices through
>> 'git grep'.
> 
> git grep writel also works.

I said "interested devices".  For example, write ops upon LayerBlend can
be easily found by 'git grep dc_lb_write'.  'git grep writel' is not enough
to tell interested device.

> 
>>
>> Also, since we have dc_*_write_mask() helpers, it doesn't look too bad to
>> have dc_*_read/write() helpers.
> 
> Please use regmap_update_bits instead of dc_*_write_mask.

Then, you are suggesting to use both regmap_update_bits and writel.
This doesn't look very consistent.  Why not use regmap_write and
regmap_update_bits?

Anyway, this is a bit bike-shedding.  If you don't have too strong opinion
on this, I'd hope to keep the read/write ops as-is.

> 
>>
>>> question generally applies to the driver. I see a lot of small functions
>>> which can be inlined without losing the clarity.
>>
>> Can you please point out typical ones?
> 
> dc_fg_enable_shden(), dc_fg_syncmode(), dc_dec_init()

I'll inline them and some others.

> 
> To provide an example, this is the code from dc_crtc_atomic_enable().
> 
> 	dc_fg_displaymode(dc_crtc->fg, FG_DM_SEC_ON_TOP);
> 	dc_fg_panic_displaymode(dc_crtc->fg, FG_DM_CONSTCOL);
> 	dc_fg_cfg_videomode(dc_crtc->fg, adj);
> 
> the FG parameters are fixed here. I'd expect a single call from dc_dcrtc
> to dc_fg, which internally does all the settings. This removes a need to
> export low-level details to other modules.

The display modes set by dc_fg_displaymode() and dc_fg_panic_displaymode()
are kinda key settings for KMS.  IMHO, setting them in ->atomic_enable()
makes maintenance and code reading a bit easier though with trivial and
neglectable performance penalty since they are done for each mode setting.

Anyway, since you asked, I'll move the two to dc_fg_init() and move
some others where apply.

> 
>>
>>>
>>>> +}
>>>> +
>>>> +static void dc_dec_init(struct dc_de *de)
>>>> +{
>>>> +	dc_dec_write(de, POLARITYCTRL, POLEN_HIGH);
>>>> +}
>>>> +
>>>> +static int dc_de_bind(struct device *dev, struct device *master, void *data)
>>>> +{
>>>> +	struct platform_device *pdev = to_platform_device(dev);
>>>> +	struct dc_drm_device *dc_drm = data;
>>>> +	struct dc_de_priv *priv;
>>>> +	int ret;
>>>> +
>>>> +	priv = drmm_kzalloc(&dc_drm->base, sizeof(*priv), GFP_KERNEL);
>>>> +	if (!priv)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	priv->reg_top = devm_platform_ioremap_resource_byname(pdev, "top");
>>>> +	if (IS_ERR(priv->reg_top))
>>>> +		return PTR_ERR(priv->reg_top);
>>>> +
>>>> +	priv->engine.irq_shdld = platform_get_irq_byname(pdev, "shdload");
>>>> +	if (priv->engine.irq_shdld < 0)
>>>> +		return priv->engine.irq_shdld;
>>>> +
>>>> +	priv->engine.irq_framecomplete =
>>>> +				platform_get_irq_byname(pdev, "framecomplete");
>>>> +	if (priv->engine.irq_framecomplete < 0)
>>>> +		return priv->engine.irq_framecomplete;
>>>> +
>>>> +	priv->engine.irq_seqcomplete =
>>>> +				platform_get_irq_byname(pdev, "seqcomplete");
>>>> +	if (priv->engine.irq_seqcomplete < 0)
>>>> +		return priv->engine.irq_seqcomplete;
>>>> +
>>>> +	priv->engine.id = of_alias_get_id(dev->of_node, "dc0-display-engine");
>>>
>>> Is this alias documented somewhere? Is it Acked by DT maintainers?
>>
>> I see aliases nodes in about 10 .yaml files as examples.
>> If needed, I can add them to examples.
>>
>> Rob said "Ideally, no" to use alias in v1. However, IMHO, it is the only
>> appropriate way to get instance id. In v1 review cycles, we've seen kinda
>> 4 ways:
>>
>> 1) fsl,dc-*-id DT property
>>    Rejected by Krzystof.
>>
>> 2) OF alias
>>
>> 3) OF graph ports (Rob)
>>    This doesn't directly get instance id but just tell the connections.
>>    Since there are too many input/output options between some processing
>>    units, I hope we don't end up using this approach, as I mentioned in v1.
>>    It seems be difficult for display driver to handle those ports.   
>>
>>    VC4 Hardware Video Scaler(HVS) is not using OF graph ports to tell the
>>    connections to display controllers, either. See brcm,bcm2835-hvs.yaml.
>>  
>> 4) fsl,imx8qxp-dc-*{id} DT compatible string
>>    It doesn't seem necessary to add the id information to compatible string.
> 
> For the similar issue we ended up hardcoding IO address / masks into the
> driver. This is far from being optimal (and I'd like to get away from

I thought about using IO address to tell instance id in driver before v1,
and chose not to do that since it's not straightforward and kinda abusing IO
address.

> it). If we were designing drm/msm from scratch now, we'd probably have used OF
> graph port IDs.

Don't know drm/msm and it's backing HW(s), so not sure how OF graph ports
can bring benefits for it.  For i.MX8 DC, it will be too complex for DT and
display driver to use OF graph ports. 

> 
>>
>>>
>>>> +	if (priv->engine.id < 0) {
>>>> +		dev_err(dev, "failed to get alias id: %d\n", priv->engine.id);
>>>> +		return priv->engine.id;
>>>> +	}
>>>> +
>>>> +	priv->engine.dev = dev;
>>>> +
>>>> +	dev_set_drvdata(dev, priv);
>>>> +
>>>> +	ret = devm_pm_runtime_enable(dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	dc_drm->de[priv->engine.id] = &priv->engine;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>
>>
>> -- 
>> Regards,
>> Liu Ying
>>
> 

-- 
Regards,
Liu Ying

