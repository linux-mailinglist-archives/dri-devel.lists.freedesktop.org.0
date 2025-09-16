Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4EB59601
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF2D10E7D5;
	Tue, 16 Sep 2025 12:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ehQ6YZ/z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBB010E7CF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 12:22:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUdroHX0vQrkaEde9o3uC9oo4inRlSZe8V8Urzjfhu47tkzDiNyWNe0ST8xg3Kdlj0oYIT083wTddrv0CurhK441yr2xBERQqr7ZbqyQAIvkcykHKOhPKN3VoeSYM7TD53ToJOzb+4UisD6Gy6GvZ3BwGCXZrxxUb3TbO+XMLG3DHan/xItB6uiyNhBTK/xUPU8e4SM0WN36d33BqAGL1Amcj2XvXcdJJAgxIAV+h4d+r+r11MfAQiwmxZ4fZWbF+SpU6m6gvcO7d0DGY4jmzlqU4Q1bJpiUFOCf8yL/86VVNbSm9b1Q8ItZdxKAJPcnAqe70kWuYt3OrOKrUktU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOSgXsgUkmSwuShQ4accXEbfGCEwzWcWsuLAGfLaYdk=;
 b=PpilAiK/m2dpQW3rElBq2LbfckM0DCb9TVqVE/ijLABDapwvzJ17zUSIPoCDiGNI2sqm/3Tz4bKV8v7pXQ4N9b/sbhrB0O04J9xtkVbaIoqKBX9/Uw6UNfno1B8jTwARGkW8Lr+Ciu/PQIjfeh/xofLPNlCYC6qHmoYGEz+WF+87C6uNmLEGSL/SbrIwxvnpJ5paDbWaKf2osX8YsRiitPXJJ9xAjNqLz1HpJmH9BB8PVAxJSUb+N6/KKpO1FAXrkiSZjJkcXQdvelXWBI4e0fU4ZctCSyOSoDrZhVauSsCJpDXUmc0uKaztD61MWZq/TCFlHCgX/UJWa+A/r8Wk/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOSgXsgUkmSwuShQ4accXEbfGCEwzWcWsuLAGfLaYdk=;
 b=ehQ6YZ/zDf346WuQ1UxHj4tf+jfzHaD0Il6JLZcMqIadj2eGOo+/228507RgwV8k2q4o/aKfuh1ujQa7XzwO5DMAr0YO6IQnQtAPh+JYqtp8rE+yCxo9mC+leLW1LLcZ5GUwxy5QjjixbQE0rY1VhCpGnIXRU16yR+ERtbuxk9rAyVSg8VXXHoFbm/pVOmClLBi+hmWWsWjzi/N4Bsk795qv9PW5tzDUf++L6vgey0kYe8Fyoym5QeiiJFginYjsfFGW4/Z6TON5JIv0gpzj/CRJ7rWXTPivIsoUyRf5PNTZt7J1eqMVtNTjVJ4x0v5HJkvH0b7L50oCCyLXzopMEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS4PR12MB9684.namprd12.prod.outlook.com (2603:10b6:8:281::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 12:22:26 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 12:22:26 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v6 14/15] selftests/mm/hmm-tests: new throughput tests including THP
Date: Tue, 16 Sep 2025 22:21:27 +1000
Message-ID: <20250916122128.2098535-15-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250916122128.2098535-1-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5PR01CA0058.ausprd01.prod.outlook.com
 (2603:10c6:10:1fc::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS4PR12MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcd27d8-ed2d-433a-40b7-08ddf51bb248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K01JZVBDSE1WL29XMFdsYnNrR1NSQXlnSERtdE9zSXk4L3BrczBCc2RFTkZH?=
 =?utf-8?B?ekFtZ2lmanI0K25zWHRITkJHRjZmOUdHUTJKRnRQYXFhZDJ6bi9rWm5hUk81?=
 =?utf-8?B?VXpDSTVSQ0pxSFNhOVB2UHhQaC9RMzBlWnpjL0VVRHhwQ1g2aE9TY215SFJs?=
 =?utf-8?B?NUR5Smc5M1VhaC9QNjFZamhZeEx4cVdVc1ozMkNHZDhibUhUMUkxM2l6Mkd0?=
 =?utf-8?B?bnhWNUp4SDgyY3FmdFkyM1YzVWVVdVFscG9vUlQzclN4MUMrdUlKR2N1Q09x?=
 =?utf-8?B?Z2c4ZnNnMzVtdGxJcjkxdGdOeUhMT3FqVVJTZDFFMjNhM2I0d1R2KzR5ZWxq?=
 =?utf-8?B?Ny9CL1ZZdWl2QWRQalFyS0ZYWUVtaG9IenBoeHVpemFNQlN0YzQ4aVlYQjF5?=
 =?utf-8?B?aWRjM1VlblVwNTRHWHozWnVaS09wNTBObFlyOG5aTCtWNFlHVmtsSnkwV3Mx?=
 =?utf-8?B?MVVDM2w1c05WSS9BYTU1ZmpMb1E3TjE0a2Rsc1dVUGNManYvZTVOVUp1ello?=
 =?utf-8?B?R1k5TUVLeFBYUTFSWUJHQysvQU9xdzEwdXFWODhiQUdjZlBPQ0F2KzNMOExp?=
 =?utf-8?B?TlpPeVdlR2dnUUl5dEwyRkUyVE1yd0Q4Y09zNG8yRTM5bmJGd0tLK2sxQS93?=
 =?utf-8?B?akI3R1JuQWxLR1RaQ1VvcWpxZ0JwdFB1Rjh4d3JuMUE5eDZwNlVld3VSLzUv?=
 =?utf-8?B?ZXMxd1lsckhCY1pxVUJJZHdCQldWYmdyMTBMNTVUS3g5T0REblZlSDRwbTlW?=
 =?utf-8?B?cEZRSUlvNWhRVGZHVE9MNHZkZFhoZU9JK0JDbHY5VGx2ZGo4bTZHdDNJQ3RH?=
 =?utf-8?B?RWZueU56bEZldENwNUxYTFkyTFh6MEIvRlJRWmlEb0k1RTJLdE0xSHFDZFVk?=
 =?utf-8?B?RkdpcXZwQUZmdFgzRFl2Q0Z0eWEyQ25lSDdaOHJ2cW1LVGpXV3k2VnJ2ZHFH?=
 =?utf-8?B?SWlRZFFnc0hMMWN0UFpLWDhGRFowQW5zVjErWm4ySDRyUUVzbHdnQWYzYng0?=
 =?utf-8?B?UVNRZkpOM0hIK1Rpbkxwb0lPNS9UcDE1dHg0Qm5aWUxucElYSkpoSkY5V0g5?=
 =?utf-8?B?K08vRU1WRFM5TFlHUkhVKzZ4NmI2MXowdkV2d2tlQktVRnQwUTdFUUhTQzg0?=
 =?utf-8?B?Zys5TytqQzhtK0lmSDJuMVR5c2xYY2xYb1N2S0dBcTJlZGN3SjJDWkxMQ082?=
 =?utf-8?B?Ly9GNEh1UEZGZVUwYTBkbWpsMTlFMXZmbWtHajluN1A4cW9hUE14bDBCWU5q?=
 =?utf-8?B?VHBQNnF4WlE0UEs5OEJTbmpmdlJJY1M3TXJlUnBLNG1kSm13WXRoUnNLMU1J?=
 =?utf-8?B?Y2F2Q1J5eDUxekMxWXVKUVBDeElLVzJzdWZaQnBHVGFRY2ZsSWdzU0w3T25V?=
 =?utf-8?B?TUY3RDBHWm9xUTZpc2tRZldOeXlFWTVQWFkwaXpXb1VUNFNvTTk5QXNObW5K?=
 =?utf-8?B?dWM3aEc0NkkwNko1QzB0b3ZYbmhNam44dDh2VXRxcFFqbitOQzV4NVk5cE9H?=
 =?utf-8?B?d2tHTTZCa1ZVTW0yYXMzYzN0dnUwRkxXU0R1Y2NNdXFJNkNSRlhRdmJHZzk4?=
 =?utf-8?B?QmI1ejZvS0cycUh2NHJVN3dtRFl2K1pzcldxNmRSNVN6WDdhNWk3dElISTRI?=
 =?utf-8?B?aHhrYVNOUWltcDlrMmFXREtIYkZiY1JwQnZmdHFSSDIzS2txN0hxVDF2cS9P?=
 =?utf-8?B?SzhUQ0JJU043Kzc4YW41RjlkUmtFeW1rWCtBcUUrTjNhMHdzZDFLSXAvblFU?=
 =?utf-8?B?MTh0Zy9neHlONFZEWU1NYnF0OUJjcHNUOXNzWEZ5c3JMbXd5VmlYVDA4Wmc0?=
 =?utf-8?B?N0F5eUJTeFkzVlI1LzVocC9OdE4zT3hrQWZpcUhVcXFiQ1lOQmZITUlwTjF4?=
 =?utf-8?B?NDlBeVZCZm9wem5UNEJmYXZGTTlvWmZJWkVZNDB4Vi9LK0lVUksveVVweWYr?=
 =?utf-8?Q?QL3hsxDgpjM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTl0QnArc1RuaEtwdWErdUVzWjhraFRQSG15aGZybmN6WnBvVlNQaUt2Y1Jz?=
 =?utf-8?B?WHFOa0JhS0pHdktPOGNhczhxMitGL0REcVcvS253R1FVL3RqSFNna2lKVXZq?=
 =?utf-8?B?SmhWenN6L3ZScllKNzQzNEpPblM0OUVQUXR2cW9zU1JPMUV1c3YrV2x2VHhy?=
 =?utf-8?B?MmVJcmp2cmlvQk9hazJaUnR5ZVhoVDhPL24rY2grZmxwSW5zWDVmTUpSSTZx?=
 =?utf-8?B?NHkvcnVuNit4K2hWcDJybzZHVVZCd0lmWnd3QnlhVGVRc1A4VUoxMXdaRHJi?=
 =?utf-8?B?TUp4djQvS3BmNnkzVTRSRU8wWUFsRVlTMDNxYm9YQmR5Vlltbzh4aXZrSFZx?=
 =?utf-8?B?Zk9McGZQaTdPK3N5aWhCaFA0Skd2dUw0NThseTdGQmZ3d1VhaEdaejZadDQv?=
 =?utf-8?B?ZCtHaE9KdkNJNkZaV2s5N09ZZG5XQVJBYUdGcFFqQ25uaGhrbm5RMmNGc0tz?=
 =?utf-8?B?SXNMWlVBWi92SHNQYkZjL3VwN0kyTGpYRUVaaDhJMUxCcVNVRTF4RFcrdE9a?=
 =?utf-8?B?V0gxdlMvTmV5aDJEWEZBQzE3dXBtSDMzaFVrUjJJbGtaMkd6RENwTnNBYk40?=
 =?utf-8?B?ME1CL3UySU1JdUd5MEk3QkNLdnhTaS91dEVvNDNIdUxqQTVuMDFjeGpFdEhs?=
 =?utf-8?B?THg4MUswRTF3ZC9Qc2o2MjFRaFN1R2dsd3ZVME10dE93dm5IQUZ4Skd5bWhI?=
 =?utf-8?B?bThYcGE1RWtMaXlLaCs4VU5KQWhod3FxZGxMR3crZEpQV1J2VDNTRDNkdm5Q?=
 =?utf-8?B?VVkzcU5QRnZ1UC8wcFRkZUZvQ2k3cGtVVHFVMjFXdWR2WXFsNWZvNjNBWC9N?=
 =?utf-8?B?WU90VlV6Smx5d25qbjRkN0k4bng1dHVuVDVLTGx2QSsxZWVMTUdDNGNTOEg1?=
 =?utf-8?B?bFFDQ1RaU1lNd3hPZDV2T1JaK1FycVYxSk1TRDU5aEZpN2huWjRTMWxRMjFl?=
 =?utf-8?B?Rlk5ZUZyMXZubE43OElxMjV0K213NEhXYnh6cEl3MzFlNGx6c3F6WWl1dmRp?=
 =?utf-8?B?cTFPV2gwbHZMQ252V1RtSGFxWUdUWS9xM1VVVGZ2V0tianhVU0V5Q3lreExH?=
 =?utf-8?B?VmxqNEtVQnZuRXkyZEV5MGFRQzdZV0IzYlNYRCs1K3JtYzJGV0JpQkd6b3B4?=
 =?utf-8?B?UlNmWWl2ZERoYk04N3JSS1JiT0RKait4T0NIWU13WTlSMnNhaHloNHdpQTJz?=
 =?utf-8?B?cjF1Q1BMa2NOZG5HUWFFdiswakd3STBSUEIzV25LeHQ4YUdvelNhUXB2dHY0?=
 =?utf-8?B?Ui9JdEUvakNrSHdNeG9MS1F0SUo1WVdrYWZhQmdFTE1UbjZFSmo0Z29hYW52?=
 =?utf-8?B?YnMxVURadzZLOHF0YjU0SHd1anVYRkxuYkQ1NVY3SlI1RWUwazdMRUQ5aElD?=
 =?utf-8?B?TEYrdWVjc2dHbHRIcVc2N3BmWGFBQ1M3VDZkc05nVC93anhXRnhKOEtlRm9m?=
 =?utf-8?B?SURmNVBtMEVJKzdtTGh6NzBRUWtCSGNTQ3U3aFFGMVZwOWdMQ1lyN0pjQjE1?=
 =?utf-8?B?THBDaHY5MC85R0JKV0pISWs4d1A5M3V0MTgvS2dnbkwzQU1iKzNiakhVaE8z?=
 =?utf-8?B?eDVzOEplaUNKTDhQcmsrRk1mZEtaOFV5ZmdHNHBPN3NaUGpuQW8xNCtlZzdV?=
 =?utf-8?B?aDRuM0xqQVlGdEtObElJTDZ1eHJaKzlsR2ErWUhkTGJZMjlBZ2dNTHI3ZE1u?=
 =?utf-8?B?NnZDQmtGcG1VcURxR3BicDdvbnFrUkRxNlRNUlRJRGcwL0RxV3NWOGRMMlh3?=
 =?utf-8?B?VFRTeFlITTRQdTVLbklCUlp1dVk4Z3JNd2FMQ21RWDBFYks0QUpaOGlMQ0RE?=
 =?utf-8?B?QlUwRFpWb052UE9ob1FSbzZFNC82aFJhckVKWVErNldaR0ZqSXBPcTNnNFhM?=
 =?utf-8?B?VUFadzdsVis0WWNaWjNoZndBYjJHQ3ZJbDNpQkg0VVdYNXRpSTV3a0l2SXpx?=
 =?utf-8?B?bjM4MzFQV0Rybk1yRGRNNmdUSkl0d3praGpmYWF1SlRPYi9QS3M5Njg2UVZ0?=
 =?utf-8?B?V3lVUnMweTFRWEZxMXNva2tXVDZhV2NGMzZSZWhYcy9CMXFyVk5LN1Z5UEdK?=
 =?utf-8?B?dlZzblJWbkFXWFZKTVNGUUR3MktwdFhSbjJsSDhNekNvOXVPSFpsMHhWcVRR?=
 =?utf-8?B?SU5BcTdMcTFNb3ppaHJRYXE1YXRSdTJwVTdEZGZIb3lBSkcxcEZ3WGhKelhm?=
 =?utf-8?B?Qmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcd27d8-ed2d-433a-40b7-08ddf51bb248
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 12:22:26.3235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muQZfO1m1ORBv2aLHcV57NCy4j6B7bTOa2YjRUgw9nJPVkWUeet3ZB15TOfhSE+0ZLqojDWrhKe4TrBAU7TiZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9684
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

Add new benchmark style support to test transfer bandwidth for zone device
memory operations.

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index dedc1049bd4d..5a1525f72daa 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -209,8 +210,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2657,4 +2660,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.50.1

