Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D25DBAD207
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F01810E2C4;
	Tue, 30 Sep 2025 13:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u0F35Qxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010061.outbound.protection.outlook.com
 [52.101.193.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3E010E2C4;
 Tue, 30 Sep 2025 13:58:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj6hFVHOaZvWcE+NiCvSEWUHTf2Vkkut8O33SzYT3YAvhVpXh6twTHneIvupC/pwSppgoKuU064Gd1E6erOKMQ6HJ6Gvt2Bz8Fx5h+QYgfzK7zEHTfEbs0RpCYoItjDIR/D6FAMgrgF2ztosSllOJgvWUkBGZiG/L2foyeIW6s0+U/ZOL2ah1NTxUqVSertTB9/pG7mmBLueiq7tAOCl4+L4DRyiMJgE9ZPKOfJGROpNZSX8+HUdSq97W88QmnlNY2tPsinwlt58fI0d0XHwBLOFTJjzfYCqTq78BtOW5uwy4NUJC+QU3yKxeHrbVrEHqSF1YIxzOdn1Vm9m6aZwug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZsbmxeAUbb7FkYH4StUKorHGYX1q33CK4JlpYm9qN0=;
 b=HVhmw6CmsUV3Tjk7tBzUgUd9mK79tXNV5/zJJ5Evo96b1PGig2n2WgImtqYfRyU0HRnPizwGeyx8pDbl2+aLXdrGDlYN3ZEc8vdhya69e1cDmEMY7rDUXDT10YQ/w7LHRE86TrGBSTLfSWYSSpjTMjSyFxzxYy+cqsXUj29B0keAIdK4s2xCmEct+0yVbAm8LYaHZjtdSBHUwEU5RrYJEGNj2ys8aXaF1mfzDFdKRirSsPkQbCwHnzxxgXJmlsLgtzpQ4sjwkzqvMWFhqQlxkrb0EoBdfNjGLwl7SBk6mrvfv+fS9p1Hsi95VB8qIkSs73quZ0fPtVNmQR56jDW+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZsbmxeAUbb7FkYH4StUKorHGYX1q33CK4JlpYm9qN0=;
 b=u0F35Qxdq3FuqjJjJKodj7QsJVPFxEcXIdr1mM4ahNlUDVFT84VmT5401+vWXo3PchP5yv3hCismpbur7vhRVHYZRu6bhPS2WLKnpqUaTBNKUh+kd8NywkfgmfhfzWmDuMdYc5kiyR5kPLgtbA2F+hPeWdxgOCKWvwuLvPZougQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 13:58:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.017; Tue, 30 Sep 2025
 13:58:46 +0000
Message-ID: <669a3b48-a1bf-4b19-b001-c0a4120d50ea@amd.com>
Date: Tue, 30 Sep 2025 09:58:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 17/47] drm/vkms: Use s32 for internal color pipeline
 precision
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Alex Hung <alex.hung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-18-alex.hung@amd.com>
 <20250930100740.40b718bb@eldfell>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250930100740.40b718bb@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0147.eurprd07.prod.outlook.com
 (2603:10a6:802:16::34) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CYYPR12MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c4b4dc-9b8f-4531-7dcf-08de00297904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjE2azdPSzQ0eFIzY3FwZFMxa2J5R3QwTmdZekV1WmJpeWluMksySUlLdWlN?=
 =?utf-8?B?Q3dmZmxCL0ZQb1F4emczdEpPckwrUWtINnlRQ1d2WFFhZjUvMmRHTWhXZ3pw?=
 =?utf-8?B?RFZ4dVV1cTNzbnZ4RCtPTXIrVTY3TzJrS09vM1NVWVF2VTREZlA2N3pocnBG?=
 =?utf-8?B?MTg4aUI1UlZ2Y3dZWnFhUUZrWU9SMDFIR2pMbHo2a3padUUxZ0V4a1ByUTB1?=
 =?utf-8?B?clpZdjdlemo2bzZUbU1GQm9NK2dNeTExaWxueUFzdjVHWEhTNDY0RFFxY29Y?=
 =?utf-8?B?NE9LWUcvTDByNXl3RytrUEMwcS9VSzZhUkJuNDk2RTNncmJtNkZ4RHJST0p0?=
 =?utf-8?B?ZjlDSytJaHpYYm5WV2h3UFI2dGROaldTWDhXaXRLNXdmMDlmWUtrczB0Qll2?=
 =?utf-8?B?ckFDSSthQnFzdWlNSmMzMERCZ0h3WE1UU0Rwa0hHbWFLamphWlo5bElrMzZ1?=
 =?utf-8?B?dGhqMFBFWS9hZENUMjVpeVlueExvQTRsNDc3Q2kxc3pOdElMYW5zZmRlVm91?=
 =?utf-8?B?NjZwbHZDTTd6ZFNBVW9UNncyMHdybFFzU0x1a3hFOFlZWjMvWG9SOGorVGRP?=
 =?utf-8?B?R0hiNWN0bFJNa3ZianlMSHNjdDFHRWRFNU94OHZrWE9UaS9LcFV0Y29JWDVK?=
 =?utf-8?B?UlRqYnQwMy81NDdiRnFFM0E5MWJGTG53Ulh2azlZcjFaZXoxamRvTHlRcEpS?=
 =?utf-8?B?ZTJBa3l0eVZObk0wbFpsN0VkUGwyWDJFWUdQNm14RTlYam9KQ1ordjJjL0I4?=
 =?utf-8?B?U2tpY3FqWS9tc1RYS3dYMDl4MTZGOWpRc1dqUkhJZFlKeUJrY0tpeVBaNXZZ?=
 =?utf-8?B?SFRDeEdJaFBWOHRocnErR2FGTG5NbiswdDhVZ1ltbjR6TG5hK2FkRTlkVDVT?=
 =?utf-8?B?UkQyNE5xSHlBa2xsZm9SRSszS216djJnRTdmYVBLcG1YaTlScE11MFpvSTRX?=
 =?utf-8?B?RnoxZ2NDSC9XMndpUFFUdytNby9KQ1RpR1pFTzZjeUpjVGNLbjFKd1h4UFRa?=
 =?utf-8?B?VDBxYVV1RXI1WHhUUk5GZ3gxMGdtbk00WjBnNzFVWSt1Zk5qbVcwalBKcHYy?=
 =?utf-8?B?L2thSHQ3YWF0OWdwdnlSNk81QzB5QlhHVmtyZ0RLTHcyR3lwbXNudE4rVWs5?=
 =?utf-8?B?aXBrdHZ5Z3JKNWNhUEhCcCttcGhVWWVJRDNpeDZaaXgxSko4bEt6MGlPU2tj?=
 =?utf-8?B?ZEZCc25KVWlFdFhEd0JMOGVlVXdHa0YzYnIzWXJSOFVPTUpJdlBydjFzZTk0?=
 =?utf-8?B?TTl2blV2bmpFMGpaYzltS2YyY2xxRkdhQUhsSTdhZG9XR0JxRW5IOTM0cGRk?=
 =?utf-8?B?VzllUlJKTTBOelpoNkZiL1FQRXRxV0tZdnBjRWlJTEQ5aGRycUNSOEZyTC9r?=
 =?utf-8?B?ZnJsbDN4RmV2ZjhtMUNnZW5FVll2VnRnenJta3RxSjN4Vkl6Zkprb3BQMzd4?=
 =?utf-8?B?Uk1SZkI5cVFKL1ZSQ0VKbTljKzRuNE4zR0FQVkRYYktiYStaYkR3aE5VdXlP?=
 =?utf-8?B?ZGZyRFl5OHdDZkZMZDVWbURRekFleTd2YWFoeHoydDZFSzZPSWRtbzZLVHlS?=
 =?utf-8?B?amEzcDl6czdsTG5vd2RmdHdKNGoya2hTN3JPbkdKOWZicWFkWFBTVTRFMG11?=
 =?utf-8?B?OWxEUlR1OW9iSTAvUG9oNTVsY2hHbHNxeitsVFlGRzUybDRNYlZlMXRxMWk1?=
 =?utf-8?B?YzFpN1YxUWJBanBFUXIxdk9pOUZFYVJlcy96NzQvZ0l2R3I0NVpXNjZZZDRM?=
 =?utf-8?B?Q0IzZ3NNdnlwU0grd3hCTWdrOGE2RmY0N0R4TmJlTE5mM1RCMHdCTUpSUWt1?=
 =?utf-8?B?SVpXQnJsbWJGWFExdUJBUTZNblhxMmg2VHU2UHRGd0p0aWhIaVUxWXdGSE01?=
 =?utf-8?B?Q2hDWit6WUpza002amNQRjNvV0xOOVFLd2haaUxHK0YyanhKZi84aXFWclhE?=
 =?utf-8?Q?ee53r9zNCEcdjKZ/2iYhogyozpnYuMtk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZacVZQWURVR1FyTEE4NUFGRW5OWnlmT1BNRXpNdmhVTG5EV2MyL3VhTVlj?=
 =?utf-8?B?aHkrL1pRcFRjRlpxaVdheGI1RUx0d2lQUXd1UlRtSW8zbitzbkNJRjU5UHlF?=
 =?utf-8?B?NUxjYWhIRkFGS3NiN1FXRFpCaDMyRW9LM09UbzZpRGdiL3lJUGZiaTJua3RB?=
 =?utf-8?B?dVlTV1lVRDh6Qmd4eTB0dG0xenF3aUxUUnRBV09aMEt2VUxqemd4dXlBU0N5?=
 =?utf-8?B?ck1EenR6VHJQOXhlUXcxL0sxWk5XK0ZHT1M3ZmZoV1NrY0JpZFpCc05tbzlB?=
 =?utf-8?B?RmRQTTIwRzRGZk8vZk9PNzk4cHo0QUU0ZVo1TU5HU1VEcW1RWXBsTkZVZ2tk?=
 =?utf-8?B?ZmlqQnZlU3RiaG11Z2lqT3BkcXpObHFuaFZNK1VaOGNTbmxuNU54VHZmeGht?=
 =?utf-8?B?cTAySVIrUlFjb25IUzQ3amFDVGMxYTZLbHBlVTVzLzRIeHJMbi9OeXplSFVI?=
 =?utf-8?B?Vyt0ZnllQTgwNWlJbU9GNDVQcXFJUGRyM0Fna0FLYlQvR05vYTRhc3ZNMU5w?=
 =?utf-8?B?aU9lNEJydzBmMm9welNkanlhbUtGVUlZMnplbE5GM2tPTEtNKytXTU91TldC?=
 =?utf-8?B?Y3VrZDNvQWRjWUFWZ2xjRTNxV282bkt5OWdnNVNOZSs2WlFkOWtyL3B6SFZl?=
 =?utf-8?B?RitDNjAwc3ZxdXUyUVMrc3ZiOTRla3J6a0IxOVlQSks0S2VJclVjTzBOcmx1?=
 =?utf-8?B?T2RXODAvb0taa2VxangreFczeE9uOHJobjJZM2N4czIzUjlOMEZnVVErQTQ2?=
 =?utf-8?B?YjZNRDhoUzdtVFI4VXgySlowcDlBUTBlaXJTUGpYWlkzajFlYmpWaEFvc1NH?=
 =?utf-8?B?MXBCR0xXN01ldHBVbXNFblA4RThUODNhSS9abFJYa2VBSUN3SFNaOUJuenBM?=
 =?utf-8?B?NWRud3FUQnNVTmFMMGRqcVRVcWY3OXh6RzVrVTlLdHN6WCtLZW8rcmt2UnRW?=
 =?utf-8?B?OWw3TDdIOHc4VWdleVFsUFJUL1hsYVgzYldEMWNlZkpscm1UbFprT3hvbENU?=
 =?utf-8?B?U0c2Q0w3cW5iSmdidHFRaCsyRXlWMFd0YlFaa2JJMGx6NEVrTVd6WHozQ0pK?=
 =?utf-8?B?YU9rK0w1aCtlOU9wVlU2ZXdMSW9iVENqSU1aeERkak5HNXUyYUxTcTRYdEE3?=
 =?utf-8?B?N0tIUVNEaS8xbjh0OENWRlA2ZXlidlA2STFyVyt4N2Z2enRZeVBxSUlSd1JS?=
 =?utf-8?B?VHZyRzFxVlc0QXlBZWhxMHYrZ2ZkZmxIL2wrcjZVTGxIb2pSVWhHMWJqL2JP?=
 =?utf-8?B?NHZaNlJBUW5WU3hPeEpPdTlVTGQrVURnbWtlbnB0OFB3STZyVnZNYnhtcmx0?=
 =?utf-8?B?VnhFM0FiZzF3RE5IdVdnSUVYOXpBLzJSZ3ZlZUtDbFgvNTZNUjlvWGQzV3Fi?=
 =?utf-8?B?VWhjd21qdlVhUFZKZzVjVkQ5cEsxcGxqNHV5N1RzaUFNNlI2YXcvM2tFaHdv?=
 =?utf-8?B?Z01hcGNZbmhVNGszS215VklIVEFtQkRvdXNQL25KbWdqSDhDZUgvWlF6eUow?=
 =?utf-8?B?dS9LdFF4dTF1aEJGcGk2MVJLd1I0c1BjcFBSVFh4VTVVZXc4ZEREN1JIUHBy?=
 =?utf-8?B?R1U5dml2MTd1ZXVITmpVem12cGk3M0dKSUx3eUEvN2VRSVdnamdpbzdnamI0?=
 =?utf-8?B?a1JNUFpURFN5ZjNZbHJKeVRMaDR0NnJld2xCYnpEVE1nV3N6amFTQkJXZ2FR?=
 =?utf-8?B?QkdYczQ4VWtPTFJJYkpYbWk3V3NERllZWVNVTVVEaTZXb2RLeDZIYTFveksw?=
 =?utf-8?B?eW5CMERuUHBRQlExSmZBa05HSEpHYjYvVlZHZlVEYi9oOCtkTHVaL0E5cXpw?=
 =?utf-8?B?ZWduaDU4eGgvb3RCR1JFaWJSbDZTdWpkQnFidW84cC94SHpaWlhjTmoySDlB?=
 =?utf-8?B?c29RdVJMTDlmdm13VDN4QkppZThERlczZmRycUZoTWk2dkN6VEVpR3dHeEZG?=
 =?utf-8?B?RXZwQmY3L01zaU51dk9DbTQ2L1p5MFpXYjEzTElrQmh5ZHA0T29wbXBxSHps?=
 =?utf-8?B?Um1kZlhYdVFROS9aelpHWHJIQlRFTEl6dGNZUDNhQm9vYnQ0OGlXdGxkdENj?=
 =?utf-8?B?QnJuRzFtVUExaGtuMExoeXE5RkZQVTVZa0tFZ1oydVRZS3ZmcEZFTmwxSzgw?=
 =?utf-8?B?Nk5uTGsyVm5PRjlYelZhTW1ZTmVrS01hTGxzdUx1VW1WOVhwdWVReXBZNGxr?=
 =?utf-8?Q?VI44ShxoGR3jzD4uMRvtLjc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c4b4dc-9b8f-4531-7dcf-08de00297904
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:58:45.8812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QU3NPOuQX1yNiVDYHWSUsIhaMye7tpW1AF6w+JTbPalvmGHhZEl7JlfXWKSVV7nKdEijpWTnEqMdWfs0dhuog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922
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



On 2025-09-30 03:07, Pekka Paalanen wrote:
> On Thu, 14 Aug 2025 21:50:06 -0600
> Alex Hung <alex.hung@amd.com> wrote:
> 
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> Certain operations require us to preserve values below 0.0 and
>> above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
>> such operation is a BT709 encoding operation followed by its
>> decoding operation, or the reverse.
>>
>> We'll use s32 values as intermediate in and outputs of our
>> color operations, for the operations where it matters.
>>
>> For now this won't apply to LUT operations. We might want to
>> update those to work on s32 as well, but it's unclear how
>> that should work for unorm LUT definitions. We'll revisit
>> that once we add LUT + CTM tests.
>>
>> In order to allow for this we'll also invert the nesting of our
>> colorop processing loops. We now use the pixel iteration loop
>> on the outside and the colorop iteration on the inside.
> 
> Hi Alex,
> 
> is this an out-dated paragraph in the commit message?
> 
> I don't see the patch inverting the nesting of loops.
> 
> That statement worried me, because changing the loop structures has
> tanked the performance before.
> 

I think this is an outdated message. I changed this in an earlier 
version a long time ago, after we had a discussion on loop structure and 
performance.

Harry

> 
> Thanks,
> pq
> 
>>
>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Reviewed-by: Daniel Stone <daniels@collabora.com>
>> ---
>> v7:
>>   - Fix checkpatch warnings
>>    - Add a commit messages
>>    - Fix code styles by adding and removing spaces (new lines, tabs and so on)
>>
>> v6:
>>   - use clamp_val instead of manual clamping (Louis Chauvet)
>>
>> v4:
>>   - Clarify that we're packing 16-bit UNORM into s32, not
>>     converting values to a different representation (Pekka)
>>
>> v3:
>>   - Use new colorop->next pointer
>>
>>   drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++++--
>>   drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
>>   2 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 0f3fcd6a5925..6630dccd68a4 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -128,7 +128,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>>   	}
>>   }
>>   
>> -static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
>> +static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
>>   {
>>   	struct drm_colorop_state *colorop_state = colorop->state;
>>   	struct drm_device *dev = colorop->dev;
>> @@ -157,9 +157,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
>>   static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
>>   				      struct line_buffer *output_buffer)
>>   {
>> +	struct pixel_argb_s32 pixel;
>> +
>>   	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
>>   		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
>>   
>> +		/*
>> +		 * Some operations, such as applying a BT709 encoding matrix,
>> +		 * followed by a decoding matrix, require that we preserve
>> +		 * values above 1.0 and below 0.0 until the end of the pipeline.
>> +		 *
>> +		 * Pack the 16-bit UNORM values into s32 to give us head-room to
>> +		 * avoid clipping until we're at the end of the pipeline. Clip
>> +		 * intentionally at the end of the pipeline before packing
>> +		 * UNORM values back into u16.
>> +		 */
>> +		pixel.a = output_buffer->pixels[x].a;
>> +		pixel.r = output_buffer->pixels[x].r;
>> +		pixel.g = output_buffer->pixels[x].g;
>> +		pixel.b = output_buffer->pixels[x].b;
>> +
>>   		while (colorop) {
>>   			struct drm_colorop_state *colorop_state;
>>   
>> @@ -169,10 +186,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
>>   				return;
>>   
>>   			if (!colorop_state->bypass)
>> -				apply_colorop(&output_buffer->pixels[x], colorop);
>> +				apply_colorop(&pixel, colorop);
>>   
>>   			colorop = colorop->next;
>>   		}
>> +
>> +		/* clamp values */
>> +		output_buffer->pixels[x].a = clamp_val(pixel.a, 0, 0xffff);
>> +		output_buffer->pixels[x].r = clamp_val(pixel.r, 0, 0xffff);
>> +		output_buffer->pixels[x].g = clamp_val(pixel.g, 0, 0xffff);
>> +		output_buffer->pixels[x].b = clamp_val(pixel.b, 0, 0xffff);
>>   	}
>>   }
>>   
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index 30941714cd0f..55440ec6db52 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -45,6 +45,10 @@ struct vkms_frame_info {
>>   	unsigned int rotation;
>>   };
>>   
>> +struct pixel_argb_s32 {
>> +	s32 a, r, g, b;
>> +};
>> +
>>   /**
>>    * struct pixel_argb_u16 - Internal representation of a pixel color.
>>    * @a: Alpha component value, stored in 16 bits, without padding, using
> 

