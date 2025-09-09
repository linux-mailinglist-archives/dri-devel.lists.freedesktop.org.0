Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B3B4AD4C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 14:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022E110E6D9;
	Tue,  9 Sep 2025 12:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EiwjHNzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54510E6D5;
 Tue,  9 Sep 2025 12:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vByXJ2pWcJGDPKejxJJIpoez0awgqjPX0TGcb6KpLhFWZJLifFc03jugUGMvSI5oN0FykBTHdrmAWztztGRYvlSo/paCZa9FscTR5i/mxZ3BkUmjIHJfA5fzNu5iv49yIESSJo9ETTvZ966OT4fbvd25G8+VCuKl3TnjwF9UiBt0ED44fVrc4+BpDw2DPJqb6bNp9VckJzAiSaHIJNeBk0lsbwkhwV7K7lwYMPouRr56T87caJaK5vn12/AaT+xY49NneRc7UPkKcof4hMXq7rhT/g7BS9sb6OlwiT3mESPbYqkkxVYI3xKk80JJn//zPgmp+ZD+BoCXB30YJ8IVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdf74tiPhOAPZ4Q75XrdlD4eYdsu8zgqcvlSj1r4vsc=;
 b=XqFqFODcyWrvs3xNDYxvDquP8wDMnfhGunn/U0p7XfELyicnVArpNcoEEAjkxgpvG+lY20rgtD0ALPJ9DpX3xwwenrV7koW5+EgWeQvmFj8mHMRNMrdigNaYbek4nPYhM7E0W57qHozDCOaao2vAMhfVF43Fy0YYH8Zgt+E7mf7Kl0UaS9sHtNPb+Vqab7DnLuvfNDFFZqMgWTS8bkccXnqu7kbYGV2sIpgb4aASLzU4HH9xV+aoRv90uzcvsrOP4Otx4wi2IwsoDAu5ZXzp51AlYElqJsbX26HSvxKmijJA5laX6VIOJ/C0OOomzYlndJUEOcXI7aWanAH50q0J6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdf74tiPhOAPZ4Q75XrdlD4eYdsu8zgqcvlSj1r4vsc=;
 b=EiwjHNzoP0kJfdkJYiWcwtA+3yqmTjfj71cCwxOB+PNK53aq5LJymLHYCmf4FvcBw6KVJxOoy8LE+0htCcAJZ35m4fYtOShnt8pqkkpU27Ay/BwWvMRsQLgX7hi6eqj986dGwL2SnEbkh5bg0jML4E9D1qVjApPzX7j3r6CkurM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:04:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 12:04:38 +0000
Message-ID: <6f6841a7-57bd-49de-9b55-b5b0514a2749@amd.com>
Date: Tue, 9 Sep 2025 14:04:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB
 tree
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 matthew.auld@intel.com, jani.nikula@linux.intel.com, peterz@infradead.org,
 samuel.pitoiset@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P221CA0036.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: aca461ac-7ba8-49d6-cb79-08ddef990cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXF1VnVZZGxsekU2dm10RzJTMFVDUndka1lYNHdxRVFzUVpoVm1CcEZNNTFU?=
 =?utf-8?B?QkNqdG5EcW9jemhoYWIzenhDc3A3cTZqQm9FeWlvTWtvMkJhbS8xdS8xMjZH?=
 =?utf-8?B?dHVBa3l3a1QwL0JXSXhpNWlHOGxpeTZyWjhMMTNxY0xvN2dZUG12VjdBVlY5?=
 =?utf-8?B?Y2hiaHVidld1RU9NeWJJMXdraHE2MW9ydjJNY3Z6dnkyTW5nL0RFWm9VTUwy?=
 =?utf-8?B?dTV2Mit3YXgvblVJQWhzeEEwMHVub0p2RDBsTGtDc0NRNktwdHl3MWxOeldV?=
 =?utf-8?B?WXBvQXozVUFJeEpWcVVaZE1qY1Q3UDVCbWlJNHpvSWZBN25wWHo1K0tFTXJU?=
 =?utf-8?B?SGR6OWI1ZkRBRjFaVHIreHFoSWNzSk56bkhCNjhmMnpER3pmZUxEeTFSMkR0?=
 =?utf-8?B?Z0lvZnVvd3AveCtPanYrMHdFaU5yQjl3dy80RmdiWlZ0ZVN0dS85N3Y0Y1Vq?=
 =?utf-8?B?SURxNXlJQ3hFNDRidUNET0ljdWRHbndKdEdiNmpkbFNnYVR1Mk1hdXlvNld5?=
 =?utf-8?B?d0VybUl1c1BuTUdiZW14ekNJOEFnVG50NWRiT0F2UHNlQVlKRENjZTZWaGND?=
 =?utf-8?B?VmVRV3Q5YlNNaE1Fc2hhVHZhWFE3ZjgrcnhaWGlBMURkVFVzSzZZL25NTW9R?=
 =?utf-8?B?Ti9KYmFmSjNqVFhkS3FLZTlHZk5RS0FLYnI3YU5tSTljY2VmSFBqaDRIR3pZ?=
 =?utf-8?B?SGRVU2E2NzlmT21PcmhYNmEwam8ySzVpYW1JQWdSNHd3a1h4M29JVDlNZDRF?=
 =?utf-8?B?d2tqdmw3Si9tak1ORjRvMTJyZ0hYOHZzV0E1Z1IyWWJSRERBekZ6NFRoTDlr?=
 =?utf-8?B?d3JocnF1bVZHeDhWQ1hLMGdjdEJPUWFnMnQ0VGZqT255Q2kvbDZUT2ErWXFn?=
 =?utf-8?B?ZU1qdHFrU2Q3NkhvZmhEWDhaZkZCMHB2Tm5ObTRrMkdYditna1BFdFNOUnpx?=
 =?utf-8?B?ZVMxZ3FaaVhlVEJ1MnU1WEpNVW0wZTEzQWZRZDZ6N1EyUFBDTm1qeXhzcmM0?=
 =?utf-8?B?TFNFb1UrUmo5M3dIRzlVK0k4N0ZkNzVUSUdaZThPeEk4eCthSFJrbE8vdS9R?=
 =?utf-8?B?eVdFc3FoR1kwYzhUMVdXdkpmaHlrdjVSR1dtcE5pNkt2TS9xRVFMQ1VMcCtW?=
 =?utf-8?B?MEFYWGg0VEZBZndYTExEZzU0dDVndnU1KzRyRkluTURqajZneTFmUmJKa2Rw?=
 =?utf-8?B?dGtlaXcvYkh0YmFycEtISjlreXg3a2oxaHphZ1hXa1lXbjArVFF2MThCRk9j?=
 =?utf-8?B?MHZRQVVYRGw5RDVGVDY3anpBYXpzbDAwYVY3b0pvdEQvQ0piempZczM5Q2d3?=
 =?utf-8?B?UnhicmgybW04UFhaSzY5aXlPMkdMVmljU1lLV283aFNFOVlYdUdGTEhaNFlk?=
 =?utf-8?B?TUFqUUZSM01UeTBjMTBsTElQcThTSzZxMjNhZ3JqcEZiVjViZnczbGx5dnpy?=
 =?utf-8?B?NEdxUng4TDNsSHJxNVliQnNtemFES2ovd1RJWEE3R0VMa0lFQTZadnp6RlYy?=
 =?utf-8?B?b0F5OUNWZlBZTnMvMlg1citaZ0ZGWVhPVG1zNHp3U2NQS0lOdnlueE1KZndn?=
 =?utf-8?B?UlYrb0NDUit6dysrWHhtWUFRUFRFdkR3Qk80UkxQbytxREFBeElWaUgxWmU5?=
 =?utf-8?B?YXR2S2hGM0JielZqZHlGUGMyMk5qdmRGd2o2MlZSL28yRnh2T0NYWW5BMFpS?=
 =?utf-8?B?bXl3eTBKYmxXdGdpd3hoZjQvOHNHak1oaHRkZ2YwdWtnZU9pMCtKelZJdFh1?=
 =?utf-8?B?YndFWXBhMktxR2g2OUlEb0s3b1h4b0hoZWFtbTRDUzVOK1VTNU5yVzlISmxx?=
 =?utf-8?B?K213VjdRdUhQZzUyelZBVC9jNHdvTlg4WmUzMk5zbGFVbVVrRnZnYmt2NlpP?=
 =?utf-8?B?ZWxkVFlRNTVrZ2RRQThlY01ra0ptcUlOYUZvck5OR0daNXNKUHhlN29jYnNC?=
 =?utf-8?Q?uFhF2mbsvf0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy9ycmI5c2lXQ1ZucnF3OXlLK0FzLzliV0dqaldnUFk0dWh6L25BNjlmWWJB?=
 =?utf-8?B?cCtVakNPYUpnVlMvaVN5ZGFvNVF4QXBWSDZsZmJmdE10RXl1KzRvTUM2T2M4?=
 =?utf-8?B?N2FPdERHOWZHbUZTNHliT2FBTTh6cFJzMjdMdm1zWDlFeDA2ZE96REtHZGVk?=
 =?utf-8?B?K2ZGK3h2eXBXS0Z0MytaT2R2OW5hVmFYNldORG05Vm9pVmU0bzVZcXZETXRa?=
 =?utf-8?B?WjRTS2NBU21TNmxyZlQzc0JEVzg2Tjd5QVM2bm1RS1EyUGMvOTY5L21tdXd2?=
 =?utf-8?B?YjM4VENGK2k0bTNqMXcybFNKWHZpemdORGZwUGgxRUpia0JQL1A3d0diRGVC?=
 =?utf-8?B?ZWtaMDQ0UGdUUlIva0pMVDNzUStHYWRUc3RMcFh3Q2c2MU1FV2xURnRNN1pE?=
 =?utf-8?B?STVVSVNoTjUrVjlYcVBTb1VVZkQwQjhlZTNLRXRTdjRGUTYybnJ1MXR4dkJ5?=
 =?utf-8?B?Vmh1Ni9NRDRCTWV5anl1WXpBZ0hZenlIYnlJWXpCVmovTmtpMHYzUjJ4K2xt?=
 =?utf-8?B?Q0F6dWRURFo0UDQ2cEkxaG95cmhUQnMzemxWY0l5QVlmZ3Rvc2RrWVdIcjBM?=
 =?utf-8?B?OHA4Q21YcjM3UmxGeitIclo1enc3S0FrbnZMbG9VQ0UvbjNVcVhXdVQ1ZEtY?=
 =?utf-8?B?VXhKWVRwUThNTHdFVDZSYm5nZEswMmIyYkpMakgwc21Yclh6WFVOdlc2NTRp?=
 =?utf-8?B?TW5UZE4zQURxTzdCRE1KTjNucjV1NFJtQU8yRTNzUEpCSTF4OFJ4VG9qVkJh?=
 =?utf-8?B?N2V0bHFhT1I0dVE2bkJBVCttTU11ZHFTUmJDcmdLTjRUeVo4cWNDSDZPS2lN?=
 =?utf-8?B?YjdqZ1FBS212MXQ5QTRQanl3TU1kRmticnhsUU5ib0xmYmE1QnNGcjVIWkc0?=
 =?utf-8?B?NzFPbSs4Q2JIRThCSXE5OGZCb3JwZ3RkN1FaSU9nSXc1ZGREQjRBT2RsWTgy?=
 =?utf-8?B?Y1Q4TFZwY2tqbmFkQ1Mrd21ueUFzQmRsMVBycVI0WVhFOTRuRU8zdklzL3Az?=
 =?utf-8?B?ajIxbFM2RmQrdm5yNytFcWE3QStJdHREL2pjUTNkajdTaEVNZ1Q5cjBBdmt0?=
 =?utf-8?B?NVNGcHNQU05FQ3NJZzMxeHFOMWljaThyY3dIK0pVV2tZQlJjdGdzQ1JyN05R?=
 =?utf-8?B?YVVlRXdZakYvUFYwQTFOaWtCOFIwaittVUFZOXJ3a1VsOWx0S0tKUDIzRnlW?=
 =?utf-8?B?NkxzT2lBOHBVUG4zU0daV3pQVE1ScGNlclk1Zy9TdzRaRS9JUnExNHIrbVR3?=
 =?utf-8?B?eDFsd2c1Qm9tczRqMWdCcktBRGpRek9uVk1XcTAxVDRmbTRWUVdNaXdtRG8r?=
 =?utf-8?B?c3d1R2NlL0lsOXJ6VFNXVTVXRmlqWURGbmxRY0YyNFIxbUZESkc4Zm9TVFJW?=
 =?utf-8?B?L2JTUHNBMEgySmdFRGt5aVZWTk9rdlZFcVdsb010a1VaWWEvMHdObFBQZVkr?=
 =?utf-8?B?dmJKWlZWTnRROTRubnFwbWNvSTJ6WDllNUNPYkFuVFBpYlN6UnNVL3VNeFRi?=
 =?utf-8?B?VUNzOVI1WmxHellZVEFUWHVqeGtienFYa2F0T3hFNmhUdjBRUEdDbFpPbTRU?=
 =?utf-8?B?c0lvbUU3WThzRUlkYXpRbmlxVWhGdDFMeXhPeVNqSWhSZWVnekQxV2EzdGVB?=
 =?utf-8?B?WFE1dGJpNDcyY2grUExJTVhpODJ2N1NYMHVVbzNJYzFJRUZNbCswMHVVeVlX?=
 =?utf-8?B?UnpEVEx4blNEV25BR1BuVlM5TVB1a1VxakN2Rk1wbm82WE5YdmpDbUl4MXFZ?=
 =?utf-8?B?QzZWcXlWZE1FTTBaemRHWTNFMVkvSjd2YlBVZEc0aUJKYi9MRzFVNVpUUUVj?=
 =?utf-8?B?RnpYa1oyZmZTR3p3b0NYTjdvUk9TN2tiK1dHNmJiMnNXQTNHM0dFTkJuZkdZ?=
 =?utf-8?B?RHdhdTl1UDd4WWdWSC8wM2JLY0tuS2RrZHJGTUdkRnQzMTh3UnNQc1I1ZVhy?=
 =?utf-8?B?UWN2VTBpOVpoZ0hDMm9HM1BzdmZQRnJBbm01ZnR0VWw1NkVKV1QvVDFNQXlm?=
 =?utf-8?B?NHNaRkY2bEJ2eEdTbWwrSlZmbGdHNTczWENRcDg3bTdKRUdwRDIyMXdGNGls?=
 =?utf-8?B?My96eDRzbjFhd0RWUkc0U3dmRS9ablBhYVdicUVWTDR6SWMza0kwYjJkVE1X?=
 =?utf-8?Q?nMmwpJ20NX3ixaBev3yxygTDd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca461ac-7ba8-49d6-cb79-08ddef990cb6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:04:38.0664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8WQTGIl0ktysYXpVwihctD91IapJ5qCfH8FFuGmytGw4jzOuI8nSGkyuyPRgPTa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
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

Hi Arun,

On 09.09.25 11:56, Arunpravin Paneer Selvam wrote:
[SNIP]

> +/**
> + * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
> + *
> + * @pos:	the 'type *' to use as a loop cursor
> + * @n:		another 'type *' to use as temporary storage
> + * @root:	'rb_root *' of the rbtree
> + * @member:	the name of the rb_node field within 'type'
> + */
> +#define rbtree_for_each_entry_safe(pos, n, root, member) \
> +	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
> +	     (pos); \
> +	     (pos) = (n), \
> +	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)

As far as I know exactly that operation does not work on an R/B tree.

See the _safe() variants of the for_each_ macros are usually used to iterate over a container while being able to remove entries.

But because of the potential re-balance storing just the next entry is not sufficient for an R/B tree to do that as far as I know.

Please explain how exactly you want to use this macro.

Regards,
Christian.


> +
> +/**
> + * rbtree_reverse_for_each_entry_safe - iterate in reverse in-order over rb_root
> + * safe against removal
> + *
> + * @pos:	the struct type * to use as a loop cursor.
> + * @n:		another struct type * to use as temporary storage.
> + * @root:	pointer to struct rb_root to iterate.
> + * @member:	name of the rb_node field within the struct.
> + */
> +#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
> +	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
> +	     (pos); \
> +	     (pos) = (n), \
> +	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)
> +
>  /**
>   * rbtree_postorder_for_each_entry_safe - iterate in post-order over rb_root of
>   * given type allowing the backing memory of @pos to be invalidated
> 
> base-commit: 7156602d56e5ad689ae11e03680ab6326238b5e3

