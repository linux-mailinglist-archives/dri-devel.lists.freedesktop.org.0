Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPIuFByIjGmHqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:46:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECEF124EA6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 14:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC28F10E035;
	Wed, 11 Feb 2026 13:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="qxfYOe2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021116.outbound.protection.outlook.com [52.101.95.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7063210E035
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 13:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyOnnU7haEbJ0LKalP0B8W9HR169JsI2gAOT2yYLivNleLssEShvm4ATEGYtrGEYYjhuf/PYctTnkXYORcJWYivKCZY4GRJFVSgXe+E6zEEoKxVWfDM5CBfSbhhmokplnP8uY4N+QmOLBtOfk7plQ7b/GU+LFgOBPKvG81cmtL2k3TqsA6WDR2a+iNCcpsdJ8dEqAM8rrXfBiXo2t1gvV+g3BfZebeu+QkGCzMQen6JCzCH5jbNv5vU+Z5V6XjkF3A6nMZ+BUDVkBN29TajIYrzlQr7p12HjZ4EEmnZSFf3NXCW7K+GpJCD0CAyN9PG/UtPNHYnUKDT6jKYoI8JoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiFSZ23be77ojYnRWb7rnQxiQw9jwiTlnrJacIrSGVo=;
 b=sfS7F2z5NBRNBt2RqkrcN/noYc4crQcaY9Fth6dMO34wHTw05JSoUVD+XmBl+QldNGaFIYSrm1vg5jzJbccT1zVD7vLbd9Hfdnh5OX0tYMXthFHtQfxUyTK/PtnEGBs9ABStv08+qFsZLlAint6ZciVyvzZWa+l8mAIclTf4opsKiN0L8THh48xPWojVo/3bgiHHLiZrI5RqxtJDJ69rQzCc6CVEppU+TVVyElY6+v/7YjCYdDSk2Pq7Lb5s5LRC6rv3Vnc6rxso5KQREzej0dec/s52/7/t83SxduSxTHBP7bWwQuUzXbftlJ3267S4rxTbYAyKRb5PcQY8VtfWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiFSZ23be77ojYnRWb7rnQxiQw9jwiTlnrJacIrSGVo=;
 b=qxfYOe2ycXfATmm6VWwxp37Vjf6y+MdxLLmRl3xbRk3cAe2htc5azlmZ2scuirddRSndSZFI1cJahL6Q64GnwmZ7YvIioDfgarhZ3ZR6DeheAGzYhEHxQwD4IdrJs5xXsb7tDjisXyMWViOmFsWX/+eKLEjrIOkOFV4u3RG9MFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB8998.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:493::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 13:45:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.006; Wed, 11 Feb 2026
 13:45:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 21:45:37 +0800
Message-Id: <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, <phasta@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
 <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com>
In-Reply-To: <aYx0a-2eANbM_vnd@google.com>
X-ClientProxiedBy: TY4P301CA0042.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d0f358-d5ee-4de8-5e5f-08de6973dee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGZ1SEtheHJYeDlHZGZDRGdkMXlESTV5Y0dIVTJrdGdINmEzeHhhMkZVZmdZ?=
 =?utf-8?B?ckMxYXRqQnlrL2dRS2lMYzBZUzR6RTU4eU5URStrNFN4UkN5a0xGZjlCM3Rh?=
 =?utf-8?B?NEtHaTJpM0JQQWRlMmxDN0xMemd1eGN6Y0tVdURtSHpucHhaU2orYW54dVBU?=
 =?utf-8?B?R0FtZ0hCcHM1L2dUREsyREhSOFVibEpKbm9pRlFyTTViZnFZVVhDM3c1OVZp?=
 =?utf-8?B?MWgwR3oxbWFNbUZzN2JBdnI2TndXTFBZQ1FwN0ZiUGxtMzBsdml6RmoybWxT?=
 =?utf-8?B?dTVPdU8wK2FCTkFSV3R4cEhFaUY0RTM0R2xOWm5kZ2lxK0FwenhzMHZoRCt6?=
 =?utf-8?B?WFVQd2J3TWxvcnE2UFNyL3BNVWVKQ013VEVIMzV2VTNDNlJIU3NQb3FSV3ly?=
 =?utf-8?B?M1RHKzdKbUg2WFdoWDRWSXhFMGNaMjFiYUFVZmpUQmxlMmJxYmhkTWZDUzBh?=
 =?utf-8?B?NEcyZ1ZuM1BnbWtHbzYyNzd2TEM0UXJBYTE2UHJtYzFzZVUxRHJGTmZ0cmRL?=
 =?utf-8?B?VzJMcFdmazVRdVMxaDJpakdmVE1xVUVxZXh0SCszdE5FNUJBVUd1NmErVDJU?=
 =?utf-8?B?TElWMUlDVDFTQTl1NVZXd1JmMTFXT0NnWlFqbnpWcWdaV2JPRnZYbVl6bWdO?=
 =?utf-8?B?aDBNUXdiNjErMDRYaWdtRmZNanRHckx5VllXc3kweGJ4VkZBd2hFQ2c4ZmU3?=
 =?utf-8?B?M1ErM2ZKd2Z3NHJjRWRMKzhDYWFjUlF2b2YwVXE4cGVFdmtsRnJ6Q3MrUlg4?=
 =?utf-8?B?V25jMWk3aFB0WVBMQnlRUThCc3Vua1V0djlWMmxBMEJnVWNPaHJ3cXMvRGNU?=
 =?utf-8?B?aDREa3cvUUNDMFpMS3UzVU5iT0wvN3ZYeHJDdUd3SWJvMThaZmZFRll0dldW?=
 =?utf-8?B?RkY5UnM4bEorTXNEUVdUZ3hYazZ0QjVtZXAvdWdkMXloRFhQQXNJQ0IyeENx?=
 =?utf-8?B?NFVnYzQrWDJiWlcvQ2tSbm1paE9NVE1tV1V4QjNZTXByMkpXQzkxVXB6VXJC?=
 =?utf-8?B?MThLMWlsZjAxNEhIRXFtSStIVEl4ejZlQjFJUzc2SHp4ditsWS9Oc2haRjdY?=
 =?utf-8?B?cVJQMmpHTXhqdnVFSUdGR0hJaXRocU5HRUJYUDJYTk90aGVJSDdCMkRDVFdz?=
 =?utf-8?B?T2pZeWtRT2RIbTBiUk56TmJLZEJTYWVZNU02K0J5Z2dKL1hkamtXclRVZUZp?=
 =?utf-8?B?cjRuZkV2RnhMbE8xbzZHWkxHYjE1K2F6WlNJTXBWMDRUbEJpTEQ5SE9wQnNR?=
 =?utf-8?B?YnNnY2VvYWdUYktjUGYvZ2hVUDJqZHhKTXk4bVN6bWF3MW5OVklXSklZdFBt?=
 =?utf-8?B?a0NGVzVqTHo5L1d0UlBMWUtobUlQblRxYWhUUStCRjJxUUl3K0lDblVhT3FO?=
 =?utf-8?B?QzZ5S0xTbTJRa3l2LytFWEVIRC9VczFjWGZmcTRJZXQrd0grQUlEY2pIQitn?=
 =?utf-8?B?SkhLNUloem9GRjBIN1lydldRZlU5OXJxMnR4N1dtN0hFdmlmSXJjaVdKc01G?=
 =?utf-8?B?aXVKV1RVMWJKWkswb2NBOER3ZGlIamJmbDF6WnpIOE5WQ1NhMS9GSm5xUWNU?=
 =?utf-8?B?VXA1aEhSd2NMUnc2d3JSRFVTajczSmhVWnludE1LcGhQSUJibmN3cG1kZktp?=
 =?utf-8?B?Y0Fudm9CbFRodWFMNmtaQmNEK0FwRHNRcU1PcDFSeU43YmZDUDlqRFFFc2dv?=
 =?utf-8?B?TkFCMkNqNDZyUE4wL3dzM3FjbUxseXZJd3dEV241OXlqYW9jdlpTZjBISloy?=
 =?utf-8?B?Ulp6ajFWZWdQTG9GU1VXTXQ0Qk5NcHYyWllVQzJaUWhvb1RWcnBqYk55Q3Q4?=
 =?utf-8?B?Q0E5NzlIZWFsdjNYU2JlbXJnV2tDZmo0Mko1MDhDSk9FeUhoUjhJTkdVcUtH?=
 =?utf-8?B?MHM5MXkvVU9GUGNsZCtpZDVMYVRlTm1iTGtQWm1vMEIzaFJrczh5T3FqSG1r?=
 =?utf-8?B?SWZUWVdLNEt0cXlteld1aVJXYzNwZzBwaUliZGFhcEJCd25YOGdOVkZFeTFK?=
 =?utf-8?B?SE5XYmhaQmZyQ3ZHV0Y2VmR3dlY0OVV4WDFITVFSUTlwaGF0VS9ZMkk5NU5M?=
 =?utf-8?B?MEFGQWlUNGlQNFZaUjcxY1B4aDJZNGlXV0UxVXVGY1k1MHkwOU5pc1pYTDN4?=
 =?utf-8?Q?/lZY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhkQjBLRGh5VXlXMjAzSDhsNUNnTjBqWGlJcEoxajNIOG96RG1reGtVd2Ju?=
 =?utf-8?B?aGN0eFIxZk5EajNlSWVDWUQrNzhXUnBCdU5COHJHSzcvZW1RYmVKdk9nZ01z?=
 =?utf-8?B?RHNxS3JWWjFhR2c0S1JLL3NvZFdPV2NtcDRjenJJckU4Z09xa3J3bUdRUlEx?=
 =?utf-8?B?NkhMOGdOSklOVU5YZVRqTjlMZy9pRDBia2xkT1p5RDBnajlNb2hOUkJlSTlt?=
 =?utf-8?B?U1ltMzlhK3c3bTJIdjg4bUxsaU84VEZqM1U1SDNrL3ozNjZzaG51KzIyY2tQ?=
 =?utf-8?B?SDZQWnBJRjNZZlRmbmo2ZExxWDFrTWZHMkhxam9NMGMwLzAvTE5MU3FmcTVB?=
 =?utf-8?B?amNHQ3NmUUFoS3gxdTVtb1oycFB2MnJTRm9oNEFtRnJUdXF5ZTViZTNmcHpZ?=
 =?utf-8?B?ajJiUXo2a1FnUHM4enRhUVJWVDM3Y2RCcFErSS9xVllTN3JGR1lUd1NmUldp?=
 =?utf-8?B?bm82R1U5RXZjV0hXS3Z3WHhPbjRDVDJKajdRcW4rdUNQQ0ZmdzlST2hLeFBh?=
 =?utf-8?B?ajhqZjJMTWpoeUlLZ3hVOTlRTXFWbHBya2prdjhBNXlSU2lGZUZjV0k0eE50?=
 =?utf-8?B?UE1RVElGcTQrWHZzUUtBeDhRQ1NuRGhaV0ZlRWd2ZHJwYXJDS2pwMnBWUk5L?=
 =?utf-8?B?VERNaXhGOXZZQ2picjE4anN6UTZZOStrcFcxNm9qSm5ud0lTZy93ZkxNS25U?=
 =?utf-8?B?YTMvSXd3Zy94U0pHSE81b0tsZWZBUms5SHlxam5NUGtLdWNrZ3FXODJydUlN?=
 =?utf-8?B?N2hjaXFKV1VvcU94cGJQMStzam9kN2p0cVdFZ3MzZm41ZnJlcUhKUkJ3K3Ro?=
 =?utf-8?B?SFRNRHBlOUtsSXNiOElLMEUxRk05S0dtRDdUWDNBdHNFWVVmNnFrMGh1WGI2?=
 =?utf-8?B?dU1kZ2YwdVBUUFpPWEc5cW96VHZudWxyTUlZRDliRnhQUHdqb29yWmFoSGRi?=
 =?utf-8?B?dURxNmFyQ1MycTNwamZxZlF5aEFxY2E5YkVNZFovZWRoRDlJZWZyUSsxNWRG?=
 =?utf-8?B?aTdrSVlUNG00WS9qRC9RR0o4cDRIa1poSXoraXA1TGpkcE5iQmk5QW1JTDBU?=
 =?utf-8?B?aFZtUVVUL29Kd3BhMDhnUkZrdDhlRm5IeVJOc2RnSEJOZzdvN1hSL1lTZ3Y4?=
 =?utf-8?B?bzhiRTl6M1lCYkI1UksydUpZSDk2M0w4NmJseWw5OFJvbm9FQ2t5OTF3cXpl?=
 =?utf-8?B?RE5Bdmh1Z3ZzK3kzWWxhd0l5dS9RT0VydWlTZmptMzJmVHRuU1VVVmNuWUFZ?=
 =?utf-8?B?bGFPeFFybThPYjk5Slh2OGhmVlU1Q3NlMm9tQ3Ywd2dpam5hWjJzZEg3MEJv?=
 =?utf-8?B?Z29DaGprMEpHb2sxNndYd0lvb3M3Vys5TVZOUXJMU21rSDhlVGtPQzcvVTNp?=
 =?utf-8?B?K3RzM21mc25Sc3RGT1BMelNyN1FvSklISHgrY3k3d1FvbWJLSXRaQ2oyWFl2?=
 =?utf-8?B?TUs4QWdMdDZ4dDBUSTY0NnlUdm1JekhVZDRNRmkxRmVZczVjMnEzTmY5TEZt?=
 =?utf-8?B?M3dhTFExUkRraDlmb0Z3Nm1BZXVQajB6SDZsNWh4OTEwRnRqL3UrTllsQkpU?=
 =?utf-8?B?WFlOL0tNcWwvNVVLM2pmZnk4WGpZSmhLUEJPN2x1NmZsZWp3Q2JFSjU5a0xF?=
 =?utf-8?B?dGRiNUVkaVRyZkcwdWpDREloaVk1Ulc2VlplYktoZU5tZVhublZsbW81eDlk?=
 =?utf-8?B?MlpSTEp5eE9MYldDTUVwNmZzQVR5TUdpUG9oQmxidWQ4UVk5eTM2bXd4VnYz?=
 =?utf-8?B?SitxSzFtcXpTdWJybHozNTVGbXNESE5TSWVHVTlCdWN1VUNZYzlXaVl3RGo2?=
 =?utf-8?B?bHFIbE9YZjkzbGtlRkdMVTBPUnVkZTlTT0lDZTA3RDRWOFZTTlhPZmluRzYz?=
 =?utf-8?B?MVdXNHNZS0ZjalJ3c2JSN0prM2Jka0dtYjNVTE5vM3N2Tk0rdFV6YkJRN3FM?=
 =?utf-8?B?YnBoOXNMMy94WHJ2MTlQU0FXNWtmbFhpVHRlWitKSGVIVVZFcnJkMXBXb2FN?=
 =?utf-8?B?YjNWRyt0TG02M2ExUlhVWlAwMitiTU9rL0xzTXIrVW5acUNzVjZyelVObTBE?=
 =?utf-8?B?RFQwVFJ4OG52NjlRS0xETTduenJRZk1lQzRZWVN4dk43clVqeUpvaVRYNzBS?=
 =?utf-8?B?cU5jZ0tRejhOQm5FVGdySlhHZlhFb1gwcmhVU05xM2NYRzYwT0lhdDVhcWZh?=
 =?utf-8?B?WC9ab0FBdmxWdkV5Z2sxVXFMaEQyd050SW5NWXVmSi9JSTVGWnpvaVlnUXZ2?=
 =?utf-8?B?N1prMDcwT3ppc3VBeFl2b0J6OGQ0c2k4MGdKRmgvc2ZQQ0RBLzRoN3ppeHpI?=
 =?utf-8?B?cEx5KzlacGJVNzZpcFlNS1hVUlA5VkJicDJ3R1l4cmlicHJwMldiSzlmdlp1?=
 =?utf-8?Q?svFD00Aa2shENZfHDav47CwoxhJBjpgJs7cwM?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d0f358-d5ee-4de8-5e5f-08de6973dee6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:45:51.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZzXo6u6O7YPwbfdNfvyiRO4ILSlcsFjFKNFon+dqOJg7NczueyI+QOewFgQIx/MR2F4S/SiRDV3ZvcwZsdSXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8998
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,m:phasta@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,amd.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 8ECEF124EA6
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 8:22 PM CST, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 12:19:56PM +0100, Philipp Stanner wrote:
>> On Wed, 2026-02-11 at 12:07 +0100, Boris Brezillon wrote:
>> > On Wed, 11 Feb 2026 11:47:27 +0100
>> > Philipp Stanner <phasta@mailbox.org> wrote:
>> >=20
>> > > On Tue, 2026-02-10 at 15:57 +0100, Boris Brezillon wrote:
>> > > > On Tue,=C2=A0 3 Feb 2026 09:14:02 +0100
>> > > > Philipp Stanner <phasta@kernel.org> wrote:
>> > > > =C2=A0=20
>> > > > > +/// A jobqueue Job.
>> > > > > +///
>> > > > > +/// You can stuff your data in it. The job will be borrowed bac=
k to your driver
>> > > > > +/// once the time has come to run it.
>> > > > > +///
>> > > > > +/// Jobs are consumed by [`Jobqueue::submit_job`] by value (own=
ership transfer).
>> > > > > +/// You can set multiple [`DmaFence`] as dependencies for a job=
. It will only
>> > > > > +/// get run once all dependency fences have been signaled.
>> > > > > +///
>> > > > > +/// Jobs cost credits. Jobs will only be run if there are is en=
ough capacity in
>> > > > > +/// the jobqueue for the job's credits. It is legal to specify =
jobs costing 0
>> > > > > +/// credits, effectively disabling that mechanism.
>> > > > > +#[pin_data]
>> > > > > +pub struct Job<T: 'static + Send> {
>> > > > > +=C2=A0=C2=A0=C2=A0 cost: u32,
>> > > > > +=C2=A0=C2=A0=C2=A0 #[pin]
>> > > > > +=C2=A0=C2=A0=C2=A0 pub data: T,
>> > > > > +=C2=A0=C2=A0=C2=A0 done_fence: Option<ARef<DmaFence<i32>>>,
>> > > > > +=C2=A0=C2=A0=C2=A0 hardware_fence: Option<ARef<DmaFence<i32>>>,
>> > > > > +=C2=A0=C2=A0=C2=A0 nr_of_deps: AtomicU32,
>> > > > > +=C2=A0=C2=A0=C2=A0 dependencies: List<Dependency>,=C2=A0=20
>> > > >=20
>> > > > Given how tricky Lists are in rust, I'd recommend going for an XAr=
ray,
>> > > > like we have on the C side. There's a bit of overhead when the job=
 only
>> > > > has a few deps, but I think simplicity beats memory-usage-optimiza=
tions
>> > > > in that case (especially since the overhead exists and is accepted=
 in
>> > > > C).=C2=A0=20
>> > >=20
>> > > I mean, the list is now already implemented and works. Considering t=
he
>> > > XArray would have made sense during the development difficulties.
>> >=20
>> > I'm sure it does, but that's still more code/tricks to maintain than
>> > what you'd have with the XArray abstraction.
>>=20
>> The solution than will rather be to make the linked list implementation
>> better.
>>=20
>> A list is the correct data structure in a huge number of use cases in
>> the kernel. We should not begin here to defer to other structures
>> because of convenience.
>
> Rust vs C aside, linked lists are often used in the kernel despite not
> being the best choice. They are extremely cache unfriendly and
> inefficient; most of the time a vector or xarray is far faster if you
> can accept an ENOMEM failure path when adding elements. I have heard
> several times from C maintainers that overuse of list is making the
> kernel slow in a death from a thousand cuts situation.

I would rather argue the other way, other than very hot paths where cache
friendliness absolutely matters, if you do not require indexing access then=
 the
list is the correct data strucutre more often than not.

Vector have the issue where resizing requires moving, so it cannot be used =
with
pinned types. XArray doesn't require moving because it requires an indirect=
ion
and thus an extra allocation, but this means that if you're just iterating =
over
all elements it also does not benefit from cache locality. Using vectors al=
so
require careful management of capacity, which is a very common source of me=
mory
leak for long running programs in user space Rust.

Re: the ENOMEM failure path, I'd argue that even if you *can* accept a ENOM=
EM
failure path, it is better to not have a failing path that is unnecessary.

Best,
Gary

>
> This applies to the red/black tree too, by the way.
>
> Alice

