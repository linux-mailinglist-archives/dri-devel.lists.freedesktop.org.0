Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C995C271FF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 23:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EEC110E039;
	Fri, 31 Oct 2025 22:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q5bEDI+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5F910E039;
 Fri, 31 Oct 2025 22:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3KmoMEngzGktJMw/tnH/hH1cVZMT7ubiamMSuGXdy+cSRjTuglWdcKWOVwPEIH25O68I42JuqZuMENszzwjYww0/wYLMeI1IvBuLZw6jfghrg/1tlrCKXyDQzeD0O3IwbV3h4t4ie7KjVPWw3a5fMINDNuSs0FaDCxNWjHWRDTaSEXQXUbMOs5/TmOCEFphSGI5H8NEBCyckWsCWJK5hGozYa3PSPcTUwMCJBpXV1Hjllw8KB0jKQCsKbjs/GcK33ieQRqEwWMmYaMnANXAK5q57/YIMD4i7AHDO+1N7ZQYQEhmcNa/GYfcT27K8BcqZ2IEbKOtudWi+hQgQ9trUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExL6cpZoFBIhjHcnb3gtup6Fbus+ealFGNVjKc5gJac=;
 b=dPEiLGxVqGYbrkNUiygNT74Gxpfqy8reDjHOu+x2Od2/keusBpDJjNw8wI3Ub6oano6aM4UN24sHOmGtkAJVrF74V18D7fd5S1zsgB9HVU95hnQoQVhMCXGUdIMgyAbesS6qB8KYjik1SHnPgzpa0jVKnerMTLn96mqEeAy1slE/Rhb4zQ3x1/y2PSfPenFmdlD5sB0knVkZI6NyiPppIMKxP69mci+OpmoH+8GVpuhE6H7iCSN+0Q95kh8wucsE/iGiXWStz4w1R33JGD/d4SL9v/qSSdUkcoipaBBBs2dnKmviYt8lVVetLBnucf7yxq+RHFEgOiN3RigbF8+jcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExL6cpZoFBIhjHcnb3gtup6Fbus+ealFGNVjKc5gJac=;
 b=q5bEDI+9xE2qK5KMlQ/X8BildT1twFCAlO+yF/1lTYqRuO9Pd3IriasxPS7n0xSLjnyiHGTHyXrOGBvLx66PAiXMTLfRgIeX5g15NMhJw2a6gAHPE9EvHyNxOGSBPuV460xWVzL8whJaqGafYciZu+EvoRT3P6QFxc+X0wamDiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 22:28:50 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 22:28:49 +0000
Message-ID: <15037859-00df-4ee8-9aed-a311b529bc0f@amd.com>
Date: Fri, 31 Oct 2025 16:28:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 14/49] drm/vkms: Add enumerated 1D curve colorop
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 mcanal@igalia.com, nfraprado@collabora.com, arthurgrillo@riseup.net,
 Daniel Stone <daniels@collabora.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
 <20251030034349.2309829-15-alex.hung@amd.com>
 <cfdc46fd-2a02-45ed-a752-25ea5a46b52a@bootlin.com>
 <41e6da0a-7f06-40b0-8e8b-ce2699fde760@amd.com>
 <b81cdad9-69b9-48a9-a5bf-e5edde184c3b@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <b81cdad9-69b9-48a9-a5bf-e5edde184c3b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:907::35)
 To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8496e9-c2ee-459a-936b-08de18ccdd10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzVCdnlidzZITWpJelZnRklML1AzUFdYYngvSVV5MlU1M3NDb0JIa0xpN3ll?=
 =?utf-8?B?SUgrcnUzTTk0WUdSSzlic1dnZUNTZldRWHROQjVCSUlpWUMxTWpZSnpTOUV0?=
 =?utf-8?B?cUVFNUhlRUtsanFlMTU3TU1aRWpTRmZaMktTaG50aDAyNDYzWlJ6cHpHeXp3?=
 =?utf-8?B?U2dOSHArRllpRVJ6VTFTRDJ6OHBWOEg5VmdQdklXeWNNMTJyOGViczVCQVg1?=
 =?utf-8?B?Q0lmcGxtcmlLNFBFR1lUZUNoNHhrMXJwSjZOL1hWcmFwWVNzTjJZOFV1RFdK?=
 =?utf-8?B?clMzbm02NFA1TUpvQXFJeHdib1VKTzUrV3dHTHNOdWtyM2dQUi85RXBHaEhD?=
 =?utf-8?B?dXh4TDY3ZEpRSmF5QllVdEhsTkhtOUpkK0gzajZieGNSakhBajcxbjlWT2dt?=
 =?utf-8?B?dGFZWGNCL2xSTFdQR2Q4YzdkaFZybUtoRyt0bFV6T3gyb1ptR2FPcUpoa1pE?=
 =?utf-8?B?UzNoazEyUWtVczZvL0NkcGNkdUU5RFRRaWZyOGZRci82Ymk2TExZUkRHWXNk?=
 =?utf-8?B?WWZPRllKNHNCQXFyTlVQSzZaQXpZVm85MEFxY2NtRGpWUXJscTdGOGtVb001?=
 =?utf-8?B?bGhVblJhcjlqdWxxWHlkdFFuK0Y4UXRCODQzQkd2cFlYZEUzVkZLckg0TjRz?=
 =?utf-8?B?UGFaT0tZY0JsSG4xQ3VMVjJYVDZOVVNzNVhjL0VOd0VvWEN3ekZ4WkdOMnRa?=
 =?utf-8?B?bU5WM2lNRnRrWC9BMUs2eDFmOXEvam9yOGdlYTNYTzFZZDgvOWE4M3NCcGQr?=
 =?utf-8?B?aklPa2MyYWhub01Sa3pZTG5zWnhmWkNScklRZnc2Ly94TkEvSzFMNXhhTlQz?=
 =?utf-8?B?cTdOQUpkNDY5cG5jbHd6eDR5WDJTYXVhM2JhclJJL00yaTJnUzMvemc5QjdP?=
 =?utf-8?B?cDNjWE1ZTDJZKzU3VGdCaEd1MW5nWUZUMWFzZ2ZOQU1nMVo3ZlQycW1zZWI2?=
 =?utf-8?B?dXF2bzdwalg2OGJtQjlnTTRxZERPYllUV3BHdXZIRVl3WUNqR012NnVVNHFk?=
 =?utf-8?B?bTZHV2JvUE5nL1M5MGVFMFFBTWFGNTlCenBjNkpTRGNYSHd4QlY3ZmNUMXB2?=
 =?utf-8?B?dTZFR3g3N0NLWDZZVnlLaXZGRHpuT3A0U01TdW1KVnR1SGdvZlh6WHZTSUc1?=
 =?utf-8?B?MmVzbjMzR0dIK0kyaVFZQlREVGFqaUhPN3dVSGNwMVhMU3dzWkJwSkRYYXVo?=
 =?utf-8?B?Uy9UUGRMRHpqOEQwOFBvREtoaUIya1lmRDdmM0hpamtGQU1QY05maUpFZUlC?=
 =?utf-8?B?YTMxNEM4SkFCRzFScnBxdFV2cU83dnl1SzZzTEIrR00yMzAvSGpuUXhjL3Nn?=
 =?utf-8?B?SzhyUzlUYUxVNGIwUkw1TFUzTFUvNDc2bHo5RVVPbFgybkp0K2ZKVThJazlM?=
 =?utf-8?B?aGhYc2NmMXZ1b0cwMVBSNll2bXMwREhmOC9hRmwzQW5xc1daMG1WYUgzV1Rt?=
 =?utf-8?B?RGlHelpHdmZ0aDVKcjcyd0FZTFEyZFJQMndGMTNUVzJQN3JMV0ozeGJMM3k3?=
 =?utf-8?B?aXoxWWVaQUdycDk0U3RxSzIrQVVWVjZySnpkeVRjOUpzeHc1c3ZNaDlLTmVm?=
 =?utf-8?B?Z1dFaytFZGZ0Z0RjWTVPSlhrR3NNLyt2UkZWbTVvNDlmWXBkZDRJZ2JYdVFa?=
 =?utf-8?B?N1ZwWFhjcWF3d05FNkNnWHZ2eDRMUzAzN1FEWVdaN3ZEaG43a0o1ckU1WkhP?=
 =?utf-8?B?Vk5Ebnc0TEYrcnhpZ2dNbzV5cnZWaFRJdFdFN1lqZE9vM2lJbnd3Nk1jcDdy?=
 =?utf-8?B?ekZmcGtzM2loVEhjUXhQRTNaUGNCWVJENkdDNlJkNWNrZW91cFZqbzBtZXJj?=
 =?utf-8?B?ZmxPMldRVS9yUlRMMG1BMi9QR2lrYWFNMEpjclFlSlNmUHhqVnBTQTR1MHZM?=
 =?utf-8?B?WS9CN3FJRHJ0c0Vnc2cxekpVSHFhODZtMWZVRFViY3dZNlZBZ1JrNytUMzk3?=
 =?utf-8?Q?DRpUofYam1QAYAhF1CG+8AL0Uca3km6R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjV5TUJ6eTQzYi9hQW9xSFVZMm5odE9oNzI2c0xtUWJ5dTN2OVljQ01iaGdW?=
 =?utf-8?B?eGpQM3pZRUJ6VkRCaHBlNHZXb1UzQWRhOEtFQmZNb1ZNaFA2aHJhT3pZMlc0?=
 =?utf-8?B?YUY0YjZQS3dReWJtTjVtWVRmSEdhakJzOEtsS2xvRitsUjV6V2xDM0ZWVHdU?=
 =?utf-8?B?UGdBQk5sNndITEkyeGExRHA1RGZlYU1rT25SdnMreEQ1KzRFRDdtNmdVMm81?=
 =?utf-8?B?TkZONWx5Q01DdVlZM3UwZnQ1WVR1RU9sQVdxTTI1Njg2MGlKaUVWdGhXNVhB?=
 =?utf-8?B?WFRMU1gvVE5PQWZyWUhaQTJEZXhOLzVJc3pVSzJKeHhNQ0xaV0w4dTVPbVlH?=
 =?utf-8?B?L1d2UHFkOU1DZ3lnaUhreFdFU2tzVk54WndLQ3dWbmc2akNWMGMvSnQxSTBN?=
 =?utf-8?B?OUE0Q3pSWXBob01pUFVaV1hua2FwUzd0Y1EyQWM1ZWt0N0hmKzNNaHgydjIr?=
 =?utf-8?B?VHpkZExxdFhrM1FqaXhHVlh6V2NUc3JtUDd4WHJJOU1xZmVMYjNoOU5xTFNX?=
 =?utf-8?B?eFZJcFhxR3RTS0dIQmZiWkd1a2RDVk5ncGg0aHE3bVBEM0xBTzBuOUs2aDc2?=
 =?utf-8?B?UGNBY3ZqenRDRlpENEpNMHFuVVN1NWFweW5raEJLbHhlRms2VXM5S3lkVTJI?=
 =?utf-8?B?aU91OExRNElLM0VOY2pzVHBjZDN0VmY0S25zY0I0dnZ2ck5nVFc4emI4ZVdx?=
 =?utf-8?B?dFUrUGxHdEFHZDdDakpGRDhad1NNMjlLbXNiRHZiT1RDOS9WalV0WDZIMjlQ?=
 =?utf-8?B?KzhGa1ZpZmk3QWxvL1NadnA2R3JJNHA0Z3hTY1VIb3JScU42UTRoSDExeThv?=
 =?utf-8?B?b0lUbmdzcHB3VHVWNFlndm5FY2dZeTFFUkdNcTVpWmdnakYwMkxxNE4yVWd3?=
 =?utf-8?B?RUdzcm0zTTQ0QmdaZ3NneXpPMXV5Q0pCZHNja1NxZEFKWnpNR29aaDEyRHd4?=
 =?utf-8?B?bitXNkdIcGswV1VTMUtpUDRPN21XOHBiWGtCN3FpeU5uUkY0eXhzeUkzd0Ry?=
 =?utf-8?B?dWl5OUE1cEJPWUl1NW1BVUtaWGMxbzVUYVFMV0p1TnhMMEpibVBmS2dBYStQ?=
 =?utf-8?B?TmxGYUhqSWlaa1hmS3AraVFzOHRiRjluc29nSWRDa1ZmREtCaG5UaG82TFJ0?=
 =?utf-8?B?dmdWcXlhcERqYTFvM1RIR0NwNjB3TGMveWpiMXZzd2xVSGNQRUJ2UXpqSUtK?=
 =?utf-8?B?UVljYWcvZ0Q0RmpKZFVnRDk2blprVFU5OVVsaXhMNG13OUV2bFNFRFEvUHox?=
 =?utf-8?B?ZUJ1cmJ0QThybmJQK0IvZGx0di9QQUlKL3BnQ2pTVUcrcDlqK0tjMFJJblV2?=
 =?utf-8?B?RE5nZTlJenJYa0M1TXRlVHlqNWhQdkk1aTdRdkRvKys2WFpHZzR2SWF4VnVT?=
 =?utf-8?B?YjQzQ2NJc0EyZC9kRXZmNU9DMHNsNkhoVlZIdk1SUGN5WFM0NHBpaWpXaVRV?=
 =?utf-8?B?UG4rckpFYWNPcHJQM3JCbkFuNGRWSmFGQnplNDg0Ukc2NWpKS0lwcldCM3hk?=
 =?utf-8?B?U2lSbE1Dd0lNdTBnUVEwTUZ1K0pSVDNLZU9JL1lQTzUvS1pydnNBemhnQXgz?=
 =?utf-8?B?dlZ5NXMvTFhCaTh2MVhtVE1zRlFUd0Z0L0VqUGNrNDkyYVkvM2xrTlVPNWxT?=
 =?utf-8?B?MEt3aUxHVXdjR0d2bDRtZS9mZlFLQnBubHBiQUNsYStyK3JkTm0ySWZMRTFx?=
 =?utf-8?B?WWl4WEF1V0w5b1IyTmFoNkx4Qlc3bExhRUFmUHVmTTVLUjJwVXZzamxwTjND?=
 =?utf-8?B?bllsYklnZ1EzM1dOUzN4RGd5Zk1lZ2ZHbWJzMlZTV0hta2NVZ0h1dHRqMWpi?=
 =?utf-8?B?N2NSbjNORFF6Ui8rUmMybHFPdW1HNU1vRTZXVk42amkxS01GL21KTnhHNW9k?=
 =?utf-8?B?MVc5VzZqMWpkVUxIME5KbnFtZTE1aWpJVkw5Ti9XcktSaGtlZHpFODEvUkVz?=
 =?utf-8?B?eURPN3Q1aGhLMUVaR1ZScnhyM2JMN2ZmbW0wQ2l1WDZ6UHQ2cnJNY0xFTVVF?=
 =?utf-8?B?Y3dPUWdCOWkyazMxOG81OUFKcDk1ZW1SM2dzeGVjczF4enl2eFU1eEl3OGsx?=
 =?utf-8?B?R1pCbzY3dkI0Uk5BUkhGelVCS3pxcHk4TityOGhUWjA0QUdNOVptM0JyeE1D?=
 =?utf-8?Q?xyEH1SStcepwe8XsYLM7FtVWB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8496e9-c2ee-459a-936b-08de18ccdd10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 22:28:49.6813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+2pU7II9DdLnU9rkROSy4Vxr/IMD3wkSJBRrrdMZdrQ3Y8MjcMNDOurX8lOr7oxuBMOAVQKhdk8HG/bsm/YgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
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



On 10/31/25 04:15, Louis Chauvet wrote:
>>
>> Hi Louis,
>>
>> Thanks for reviewing.
>>
>> Do you want to add these patch on top of this patch as below?
>>
>>     e1c34c68dc33 fixup! drm/vkms: Add enumerated 1D curve colorop
>>     68251534ebd1 drm/vkms: Pass plane_cfg to plane initialization
>>     8160438be2b5 drm/vkms: Add enumerated 1D curve colorop
>>
>> I noticed "fixup! drm/vkms: Add enumerated 1D curve colorop" has no
>> commit messages though.
> 
> drm/vkms: Add config for default plane pipeline
> 
> With the introduction of color pipeline in VKMS, the default device may 
> have planes with color pipelines. To avoid breaking existing uAPI, 
> create a kernel argument to disable them by default and a vkms_config 
> field to configure the plane.
> 
> This field is not definitive and will be replaced once the uAPI will be 
> able to configure color pipelines. For now devices created with ConfigFS 
> will not have any color pipeline so we can decide later how the uAPI 
> will look like.

Thanks.

> 
>> Or do you prefer them to squash them together?
> 
> For me 68251534ebd1 is independent so keep it separate.
> 
> But for e1c34c68dc33 I don't think this is important to squash or keep 
> them separate. You can do as you want.
> 
> If you want to split it, I think you can put e1c34c68dc33 before 
> 8160438be2b5 so you don't have to change the call to 
> vkms_initialize_colorops(&plane->base);.


vkms_initialize_colorops is introduced in 8160438be2b5so and thus 
e1c34c68dc33 need to stay after it. I think it's a minor change so let's 
not move the function vkms_initialize_colorops() from one patch to another.

The patch order looks like the following.

e1c34c68dc33 drm/vkms: Add config for default plane pipeline
8160438be2b5 drm/vkms: Add enumerated 1D curve colorop
68251534ebd1 drm/vkms: Pass plane_cfg to plane initialization

> 
> Thanks a lot,
> Louis Chauvet

