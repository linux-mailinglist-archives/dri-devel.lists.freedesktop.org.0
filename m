Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E19BFC9806B
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F084910E3F4;
	Mon,  1 Dec 2025 15:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YT4z9Na6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013006.outbound.protection.outlook.com
 [40.107.201.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F8610E02D;
 Mon,  1 Dec 2025 15:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqN+LpnDeISME6b57zdjCz6JDv1sB7f/vvRqg/i0FWRn6BCoXIjAMrJhZMAbUvsRDOoRugRUmzlo4xpuSkwDbbxtWoVKn7t1VyOOBA/5MoyOQ1oOAAqbWF4FZWfBZdarone7LX0jqdxOZu097zkwgNDOSl+/5R5hXB0VYWKNOgZkMml0s0+zg8cuWN5NAzfwxmUI4DsYN1m8jZKEZFR3H2tsQ5B86xyfIZWHaR74eWX7oiqQAPdTyd3EvWL1uDjG1kE9CzT5e8TX/ugM30qTl4Dgw3LvV7ns/WAmFeCuHyLvucTVJt9GaKtv0Wcg8qnTIP/mh+PLWOT7awocNyZUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6LQVIB09ji7eJugYej8C+aATqyje7OM/mz/F+NQP/k=;
 b=LgyCC4Cz1IxMRjCURHwg2/P5z7JEaBzyR3vdi4mn88/9cUXXc3xVxo1GtBAbwGI5iQqx3MosCfDPiw69xoo+4/20riorE4+gcqWU8BofkOPMfwwHf5LPmfQIr0T1lyTChUDXV4TL1bQ0YNSXA1emFA4Gu4UTPNSvH/8zhOq5AFmIOvaz+MqOrl+C3w5KAEvLZOdpDy4BAcnOAwGlMh5kFRCPo9FhUn1KGqTF6xganMbvXOl2mVXYH+dpSjdd2tlP1B3Baxyv6jHcKxVGKhVKOsX9mvV5zEWIZLDUKhSurdM70BRmyhOkRAdWS91nS+EaptjaaabUbjbUzpUMWZJsUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6LQVIB09ji7eJugYej8C+aATqyje7OM/mz/F+NQP/k=;
 b=YT4z9Na69Gh1J18iqGMc7l9GtAH9T+zZiXo9gpPw/vpnhYgIutWV/fBu+eWgrZkL6nlMSx9xHsZveYscJR9YE0Nh/C/xbOt8YHqLSLstPmbRSQCJTVK2mqT/so+MTf1tnLi8RfbbZiMln5orLbUutZWpPsNYw25zYa5q8G3MxEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB6931.namprd12.prod.outlook.com (2603:10b6:806:261::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:21:43 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:21:42 +0000
Message-ID: <49184653-66b9-4b7e-89ce-bb8f28946694@amd.com>
Date: Mon, 1 Dec 2025 10:21:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] amd/amdkfd: Use dma_fence_check_and_signal()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-5-phasta@kernel.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251201105011.19386-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::11) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: bd22b417-efbf-44f0-85bd-08de30ed5517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjFZbW5GSlZzTHlqY1NvWW54TGxWdzFnbDczWisvYklMSzQ2TUdOQ1RSeEFp?=
 =?utf-8?B?c2ZVR1ljUWM1NnI2UGtlZnZhNXJjQ1lwSjFHZWtJRUE3UENRYXFmcFNGcStV?=
 =?utf-8?B?Q2VhN05jaEk5ZU9pNGZ5TWQvOVhWMVZCRVhCdG9ZMXFFMzJ2YkFYZXBUMWNL?=
 =?utf-8?B?MGdxdzVodG1LRzk5dDRHYWoyc0N6dlJYZ3paeU44TXo1UFJaSFlNMCtEMUNO?=
 =?utf-8?B?azZRcjNXRzBjakVGRWhGZWEvMThKalJwVkdpUWV5N1ZKcXdVcklvYVRnTHgw?=
 =?utf-8?B?bkJtZVhJNFBwUXEwL0lzSzM2UVMxeFFyS3d6VGNsOHFOeE15d3kramRzUWsr?=
 =?utf-8?B?SnZwM2ZOREd4UVVySFAxRTFwM0xRbFdlWm9RMDNQSFE3Q21LUXNsbHAwb1pZ?=
 =?utf-8?B?K1ZIdlRtdXYyREhWczZuUG1DZUl4eFhGZWsybDZ2b3RhTHhSNXNHTEhhdFp3?=
 =?utf-8?B?K2ZKWFh2N2VVY0NDWVlWZzhKckdQNmpoY1NBRytQR1FoSTFIUDlZU1Nld2FD?=
 =?utf-8?B?b0pJUWJ6aHg3STA0V0l2cG9oSGZiYTY0NGVyU3ErQkdSaWNTUFllaXJUUnh0?=
 =?utf-8?B?R2MzcXcxUmwrWm1YamhYVjUzdTRYVmI1OSsraGN2MncxSUlncnN1NFRINWlP?=
 =?utf-8?B?emZ2MnN3SzI1WWhGYUpLMlMvMVJ4T1V3anhsZkhhclJqbXE5YThyRXdNZTJK?=
 =?utf-8?B?WXQvcmdObkxrM2RJSGFHRTAxRDh2ek9FaW1UdlJxUkcrenpJdEI3YytDdjlM?=
 =?utf-8?B?NktIWlhWZzREQ3dRaWVQZjQrWFNMaTkzYWhMZWVzMk4wOTQvY2Q3dktNRXgv?=
 =?utf-8?B?ZkZiMmFXdTZ6MGZuQzE4a01mYnhwY0dWd1dzNUVqa2VDZGVtY2U5UkJGeTBw?=
 =?utf-8?B?NkhIcnAxT3R3R2RnTVpDcFMvVlNMT0hrbWg0T09OOUJ5S1I5RFhPalphcCty?=
 =?utf-8?B?eVFsbjlxUDU0ZGhNTk9Zd0srdXhsaTZyY012cTdBUmxVN2ZWeXNQeEVvcEE0?=
 =?utf-8?B?REsvVUk2Nmpyc1c4RDE2Q2pNYk9HbUJIZ1FjRTJJcjZkRFNqbCtGN0VPb3VK?=
 =?utf-8?B?WmdzZ0tDSHdsOW5TVnNOQzhwYzRrUDZxR1JnZFowd1ZVeUxZTGtqeXJEbU8x?=
 =?utf-8?B?SVVQRFd2UW44eVVNSU1SM1RqMDFWT1lOSUhUTGk3aHYzOWZQTWVnbTE2cno1?=
 =?utf-8?B?Z0lWT0F5UWE2b2tEbTJ1QmcrZ3crYU1lbXk3eUlOc0h3ZDNXcW02NzhNZjlz?=
 =?utf-8?B?RVR5U2dvd1R1eE5YVldlOHBwRDRxWHIzSkRTY3VIRllOSlZtT0tLOGdDQ0xV?=
 =?utf-8?B?VUtId1dMMkNFZmlTeXFtKytQanplTG1aYzJUbXljKzlvZlhMOXZhL2svMVZZ?=
 =?utf-8?B?RENTQ1V0Z0FwaGh1bWNMWm5qbzhCNnEzSWlyMU5KK1dKOXZkN1E5bGFPK2E3?=
 =?utf-8?B?K04rUGFZY1BpaTVpUXFwZ24rbURUVVN5Ukd2aGx6QW5XWlBjUGxmOFNhQ294?=
 =?utf-8?B?Y1ljNG5laXJkSkkvTU1pbHBMeTR3cW85SEhTYkRoWEVCZmtMYVNqZ2NxQ1Bt?=
 =?utf-8?B?enZEdkdYUTZPS0JzZy9TRngxSmRlbDRGajNSV3hVNmhTenREWk5PeVpHb1I1?=
 =?utf-8?B?c2VPL1hPQnhOaHFReWlDZmhhTklqb3YwandlYWlvWUU4SEswR1FLUlljdHBu?=
 =?utf-8?B?WkRXRlplc0lXTkVlVC9TZnZteFgxdE80ZVg0eUs1WGpvTmxQVmdIcFY3cWw3?=
 =?utf-8?B?VzdwS0Q2MHZNRUtnQ09sWTN2dlJteXFZMlZua3plTDV1cWo2YVZsVUw0M3ov?=
 =?utf-8?B?OHoxUmFtaklqYUZJSUJrTGlwSnpRM1BMTklZOUJkZGxxSXZxU1RDNE1EaWhY?=
 =?utf-8?B?UnVJcVlnTDB2K2RJbWlqRmNhQkRieDZydEYrUzRqbVhINzVPd09BOXZOYVlq?=
 =?utf-8?B?SVhJR3FMSGE5cmVrZTh5cjJncG10RFhXWlFyR3QzSE9uQW85TWNFbmdvZlEy?=
 =?utf-8?Q?TqGaYtZgQbWz12z5LW6u66ywsL5mRI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXgvUGtYSDJCN1JGYmZFdHZNc3hnZ205Z2pvN1hZbmNieTBxTTBVa0E0ZTV2?=
 =?utf-8?B?MHBpQkQvNDZsQ0pzMWdFaXNFUk40dTBNUnRNeUcvU0t4UjVWd3BhbnlYUG95?=
 =?utf-8?B?eHprd2gxUERnTkw3THpkcWVQVTdjb2kvaFZMT1ZERTFSdVlNU1MwV3VNQmdZ?=
 =?utf-8?B?cHNqZEg5QlF0SVpGeTlHNzFmMU9NRlB5Q213NERidXE0anVLQ1NXWnNCcVI3?=
 =?utf-8?B?TkZtYlp6RzNTcG9ER1lRL2xzejExamlnNjRRMjg1enR2NHc2L0VFWmpxOTRs?=
 =?utf-8?B?MnlJZXYrYUpXSE0vdFROWTA1WCsvalJsSWxKK09BcTQ0Sm94ZmxTc3dvemFM?=
 =?utf-8?B?N3REbE1FTG9xYjUzRjFybEVGTC94SUlFcmhsOFFuSmJ2djRmZEl2d21WTmdO?=
 =?utf-8?B?aGltc3psZmhQQkZmYWtLemRpTEgwVEt0Wktmcm5XdWlsU0VleXJuUE1BQThz?=
 =?utf-8?B?UWZWV0kvSFY4QldDQ1cvUmtYMjNweEVhWDNPWFNrZkRlbWRRV1VacTBpQXNn?=
 =?utf-8?B?MTNFSlpLOUMra0xqdUNjUnNLSmQwd0xweHlCZVFwSzN2Z3lINVVWOGgvQita?=
 =?utf-8?B?RXQrdTIrMzdXWmx3TzN2dEZJaytscHdrTkc0c3U2eFFMNWF3SnBBMVB3RDQy?=
 =?utf-8?B?ZVQ3MWVTTWRsZStENU9zTFRLN0hGMzhSTEFwS3p4S29xR3hzK3ROa2VLQ1hZ?=
 =?utf-8?B?UnBVdWkvcjJlZjFZS1pBYk1HMFgzMGY2T05uQW9GdEhUbTJwcG50cjZyMVZs?=
 =?utf-8?B?UDByaE5HMDhzQk9zQ2xpTnBCRks1RktzNXhxR09rbjJnRi9RVFptTFFpVUdw?=
 =?utf-8?B?QlVvSlJob0duNDlwWjNEdlJLUHAxWWVzSkRzUlFjQ2FSajFjUDNMTVdVU1lH?=
 =?utf-8?B?SUJHUExOT2YxSzVEaklsQzhDYmN0dEdjMjFDMmlwNHJiblAwcWxDZlVBeENR?=
 =?utf-8?B?VUVvcWJ0Sm5QenFCWnRKNzJlRCtzbEx6TFVTdDNVbkMwWlB1TURFUklRMGRQ?=
 =?utf-8?B?M2szNDU2K2o2dkM4SVN1UkRDdUgyNVFxTDVENWFuM2w4TTEydUw1cjQvc2xz?=
 =?utf-8?B?TDZNL3hkbGtCckphWlNkZTVUWGtYRURKRDBjOGhxU0pGZzM0ODJ6OHFMMVEx?=
 =?utf-8?B?Tm9EdHZOa2MvTmc4N2x0WlozOU5JQjF0Z3JiaVhld0kzbmQ3VWJlRk1FaTBC?=
 =?utf-8?B?eU96UkU0eGZST1VQUHVGamhUUERYWE9JKzRoU29FMFpuUU9hLzZuaEFyMUhH?=
 =?utf-8?B?ZHVkeGIwVUhuVS9pRlc1N1l2cForSDFKYVpxVVFTZ3gxTlI5dko2cDBtZWE3?=
 =?utf-8?B?eWFzZFhvcHhweFBZdWVoTjJuNXk2TEhmcndBVkpFaVlqVXNHdGpEUk5ac05F?=
 =?utf-8?B?MlZoYWxUVHJWSGs5UzM0QlBPMFdqa2o0cU1hbEJWSE1IUTlkdnhqUFBkWW5N?=
 =?utf-8?B?c2paM1NETGxKd2hiUVN1WCtnSUprUGFiQTlCS2psT000YzZGMGVXcGVrYzk3?=
 =?utf-8?B?QytzUXkvWi9ZQlgvUmpQQ01LbjdIWEl5YjVsMEowQnB3V0FqQ0RKQWcxTjAx?=
 =?utf-8?B?c3F5K3RIdHhYNlBkOFA1cUx3Y29aUVJEVzI3czJTd25pNUYvYjg2QUdiVHZ4?=
 =?utf-8?B?YjZJM3lxeVVJQnlRT0Y3THlwVXB0a1F5QVRnY0FVMjF4NVAxTFA1bmxxeW84?=
 =?utf-8?B?QlJxcUdVV3VOa1dlYnNXanRFcTlsRnVwdjRXakxRYjBaU2pzcVp4VzhwNlhI?=
 =?utf-8?B?YWEyM29xQUNoQlNIay92c0RVVS9kMEpwMGdIRlQxdmI3SzI2VjNuOHQ0Z3Zj?=
 =?utf-8?B?S0JUOS9aWXRQbFpLekh1M0J6SzdUa3VrQ2pST2llT0pYM2hLeFFPcG53NTJw?=
 =?utf-8?B?SDhwSmE1ZDd0WE54ajdKTTc4WDdjdjhJU1R1bnJlTm8rUzB1NGdDbGZGVFlX?=
 =?utf-8?B?MnRYWVFLQjQyWC9PUWM3WlJUdVFkN05UOVpHbWFYMlQxQzlzWHFzSjB2bytv?=
 =?utf-8?B?RjFhM2dkUTBuR3RwZnlaMElYcER5K29sR2hjejdzenl2WFJ0dGlLbEZ0Um5H?=
 =?utf-8?B?aVlaVkFoYVBoVjRzVWhpd3poZTkzVHhTMkJpTTVzaEtNb2wwNkRCM1RuM1JZ?=
 =?utf-8?Q?k48i1Z3AwHEI1f1UPlC8Asgk7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd22b417-efbf-44f0-85bd-08de30ed5517
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:21:42.7622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4vOpOVjcAuiaWozieJasi6CEzf9RD1Xwo5JnbzDlQfhxT7Pv4kwE7aikfsXRTdvfzG0MfYnrTUND5zJ7UmdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6931
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

On 2025-12-01 05:50, Philipp Stanner wrote:
> amdkfd is one of the few users which relies on the return code of
> dma_fence_signal(), which, so far, informs the caller whether the fence
> had already been signaled.
>
> As there are barely any users, dma_fence signaling functions shall get
> the return value void. To do so, the few users must be ported to a
> function which preserves the old behavior.
>
> Replace the call to dma_fence_signal() with one to
> dma_fence_check_and_signal().
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

This patch is

Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..4dc46ac6a65e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1983,10 +1983,10 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>   	return -EINVAL;
>   }
>   
> -static int signal_eviction_fence(struct kfd_process *p)
> +static bool signal_eviction_fence(struct kfd_process *p)
>   {
>   	struct dma_fence *ef;
> -	int ret;
> +	bool ret;
>   
>   	rcu_read_lock();
>   	ef = dma_fence_get_rcu_safe(&p->ef);
> @@ -1994,7 +1994,7 @@ static int signal_eviction_fence(struct kfd_process *p)
>   	if (!ef)
>   		return -EINVAL;
>   
> -	ret = dma_fence_signal(ef);
> +	ret = dma_fence_check_and_signal(ef);
>   	dma_fence_put(ef);
>   
>   	return ret;
