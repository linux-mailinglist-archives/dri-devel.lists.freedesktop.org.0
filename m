Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1C716E58
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2B210E198;
	Tue, 30 May 2023 20:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82E210E195;
 Tue, 30 May 2023 20:07:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZuzSdD7SDp2nCYHi3luwuGSf3sSZ8HD+fM7tp2jsF9MVQHZLRBU1o8hPQBUETmP0hV260BxreHdSzymk/TIlHUecOQuTyJQisqH7XWiwp4QI3zXWsxQkbj+b6dMvGjzRFfp6iyplj+qtOoQ/6xvSyePpzi0Zwia7pqnKCuu3BQd6oi80wFhy28DGHOreVqi5q9lfTbLZr4n8xMRXeqUJbjmqw654LNbchvj+0g5n/iQHrLYdz1MK+HoApdTEfC1e/x5W2MWwiqVyYQbcrRSTkl3DURSZ9sGXvDqcxE+aJB4MklSabKQvejEEZ7z8vEMAGOdTIro6kRK0J8e3BAK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hq+aKQ/NCPV1Lws028w3mLm+1wYyjpEU8+rfCinEeeo=;
 b=ENbl1Ixgb9YeZ8176SO+9vBDGuoxOqml+meRMl4DKBviwcKwxjJsMMjs3Ln1+5EPrna+EapcbvKRBjadYzFRLEq+Ng/kHLMs5Pj5AHi+DoLUR8O4ypMpnwY3XMdCjZf99jYzke5tvnI8cteyb3qOFKHBq6FKjFFYx86PcQuzsxeJaqaNdwwqAsLHpjHXNBoBOJMts9odjvhxOn/MahloiKsEAZt7bUlcTFR43Hd4AeVy7VMT2yYARJ7Neor6iRQu9t/mxJM5o2iHVfXxaeHRfs/xYwDE+bhivyYnE3P35UywiN1aHHkdQnQWyhWQ2hoCxLP/C6KkQNfah+YJEFyaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hq+aKQ/NCPV1Lws028w3mLm+1wYyjpEU8+rfCinEeeo=;
 b=3fTPKfmw3GYRzV4Q1FJQhCrpUYeBFfcUBLULoQj3Ft/ReXARHXWX4LoShVRugs4V69Lg2eF2jcTFIk+p4fAt5p+N84+vzzQkHoMuMHWWd2rZtg8k8VszTzXpEBA0v60yXMnVLtfbBbrSD4bF27+dAft1Lz3eVoYqOjHohsNXOcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 20:07:18 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:07:18 +0000
Message-ID: <d9c2ada6-6c1f-2f13-d15c-20f72ffd34c7@amd.com>
Date: Tue, 30 May 2023 16:07:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 18/33] drm/amdkfd: add raise exception event function
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-18-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-18-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0392.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM8PR12MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: b4601393-947a-4148-d8cf-08db6149786b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XfA66emjNpkBwbCxSf2Y0CIYCV0b1cOr+lfpa7D5iNNqU0LClCpzBdFeZHKQ9UoIVSWtXm9VZCeM3eblwgF7FowMMpXKCQmj6bGdJ/nmjsfNRBNl4DABydHqkGJtqPdzOMcKSOJimkDhOgfw7K60mSfMZba3cUFFJrOC2ipz8edFzlpZOjlEDiSVY3/W+gxMujjO7AlGPnAQekL4a/NNM3QfeMyxjXN2wT17AuqxN9CN0hlkDzQViF+hWmdZnG6i/mJ7a+eTn4Rj4YYVtUxzhdHBF1C4O7YySMujsoKzWhVghdsHlPT5a+XIhETIjXhLQAYK1D04SMc4g/XYsPZl1ZlpISxkZUntPCZ++xB88WON7bH7nhQD6YNNGS7HU/p5wC3ILjjetd42Hy1AU1NLzi09hUg/Qv1diLO/2xfxswdHBY2bCPDCWUnWPpbfo78MF3bt3p70g+5Pp0fj/6QMD+yvgu12uoNF6Ss8YCZ5yNOjguqHDLvMUMjZrzrDduujLK1hBIBkZaiVH8xqEY2sZ4+r3hhDOmJJD9GqCpDFoTbVR1xqtiEDsRqYbB6gcbKoH+bTMhN2R1LxXXfhO+XTdoWjfWlhpvZt8cE6Nam5tG0yjx7pqycG2tBHECli023Xm3NH7hWRoKNDpKzxNZevNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(186003)(26005)(6486002)(6506007)(6512007)(316002)(2906002)(5660300002)(41300700001)(36756003)(44832011)(8936002)(8676002)(478600001)(38100700002)(31686004)(4326008)(31696002)(86362001)(450100002)(66946007)(66476007)(2616005)(83380400001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2FLZk84OXBLaklnVzVwM25YcGFIYzhnaWhLbWtDd2IwY0tCTmVmb2JraDJS?=
 =?utf-8?B?TGxEckJGTlRrVEpVd3EwK0oyR2l0TWtYYTFMclZMa1l5OHM2QmZ4RGNUOU5T?=
 =?utf-8?B?bU9YTWFFcVd2T05lSlkyME83TitBcUlTeStDYU9pdllmNDRyTXhPTDVoR0U1?=
 =?utf-8?B?QndKM0xVTldVZ3VDM2cvTHVlck1OL3RRbHRGSEp6SnpnQWtvbmhmZmtzWGJF?=
 =?utf-8?B?V1l4NDRYeFNzQU1ReVNpYVNIeExFTkJPRVBWcHlTbkhVc09HWFU0UGVUdUNt?=
 =?utf-8?B?QzBDbEhDM3RuQXU2T1dKS2gzaWNVd05qZUdUbXhMcXU4eWR6MDF3SlpybSti?=
 =?utf-8?B?SWlPLzFpdGxRVzlLUjJJTDRMNWI1SVBpV0k3K2FUUTg4RFZKbEVPN3NEb0VL?=
 =?utf-8?B?QnVRMmFxdi9semRGdWhra0k0YTNlZzlVa2d2N3hydi81OFZUMENscWhHY0Nj?=
 =?utf-8?B?VElrY0pQY2RVWlA0Z0swdWZiaUVZZFU4STBuejR2ZE9tSG5oR1pQOGFwYkVH?=
 =?utf-8?B?UGxLcnRzTCs1OEZjbmRKMXpWcDRpbi8xL29Hc0N4VmlzanlKdnVIQ05PNFJz?=
 =?utf-8?B?bUQ5Zi82NHNWd2FCb0tKd3dZdmYrUmNFTkhibjRTeHhuMERLbDFmUEFrQkM3?=
 =?utf-8?B?SHVwbWRRbGtjQVQ4cFJXMWxCUGVVd2kvY0Npa3ZoT0daa0x0RFVpbUNtWm1M?=
 =?utf-8?B?eG1nWHR0R29Kays5WTMrVC9nSk5uU1pNY01CSjlLaWhNMi9Xc3VpTW5ZWk14?=
 =?utf-8?B?RjJQVHQ3ZCtPT3BMUENSdXlQTEpMcXJEVmsweVhObnRxRWhIalpGU040N0hk?=
 =?utf-8?B?TGtNWjBJRyswM2RNYmdXazFzYVJ0WW1pWG83ZFZ6VG1GMzVZc2FQYUhyTXcx?=
 =?utf-8?B?VUdwQ1NZRVMzdjh0YXhLZVRabDNrcUhncENKUkR5ZTBUcG9TTVM5NWk4NXJW?=
 =?utf-8?B?eXBVMGZ4QXJBUlQwRXlCdHo3TnN6emcxNTltQXVnOEhhWGlvMVByTko0dzBQ?=
 =?utf-8?B?U2ZEUWtDdXBoeEx2ZGlpb2VSRXFPM2lxSkRCU3EvRGViT3loYkprMDFnUHRq?=
 =?utf-8?B?MlR4T1YxRnhmNUhQWDdIV09ucVVyUFV2ZGVTZVRWSEdtRnRKNDBvV1R1dlhX?=
 =?utf-8?B?andxUW02dTRvS1kyME1nM2IyUzFCNCtBVHZHRFY5a2R2bmM0Uk9VNS9oeXdX?=
 =?utf-8?B?amx5L0lLRWVDQUw1WEJHdm9vVzQ2WHdpU3NrMlpUMGJWeHRUbmwwaU1aWmZF?=
 =?utf-8?B?YjBIYkFLWXd6ZnNNUHV5TWxYeG1ZYVdlT1R5M3pvbXF4L20rb3F5Y0dqQis1?=
 =?utf-8?B?MWx5dEg5bTQxcmJGbklwcllsd0NWZDd0TjdhM0QvTDN3M092SVMvWFJtWEJu?=
 =?utf-8?B?NnU2SCtPS2ZLR1o1MXRtajJUM2pFMXhXMkRQRlVNK0o5RzZpcnk1TWxtdWsv?=
 =?utf-8?B?VW15NFlTOUNxczI5YmlKZDhxVkpIT3FmdkRHdWgzNm9BazVrNEJqVlhCRHRU?=
 =?utf-8?B?Qm1LRXBqMkxKNzBjekNZRVRDT1JVbjhKYlBHOEhIZ1hENzZLemd1RW00RVRJ?=
 =?utf-8?B?NzVwRUZEemRxUnlSRFBkVEZLREZQZ1d3ZGlHNGI4TVVYeUhOSjRrZ1NhNmN6?=
 =?utf-8?B?UjlndnV0Rlg4aEZhNzhneHBwRFR4c0c5ZWh4anNsSlJtMnY4MzJBYlc4V1FG?=
 =?utf-8?B?YWRFUm5ObytTT2VSWm1HTnVTQkNyQWFqYm5iRUJRUlJTdFd4RUNHeDNweHIy?=
 =?utf-8?B?akpUekFlbU50dk1MM05qbWU0TlJxbVcrLy84d0ZiWEhXVzFCMEdRS0EzMWwy?=
 =?utf-8?B?N0NQanRqL1I2aG9Pa0s2R3U2R3hickREc1Bvd2VianVDcWYvbEdiOUI4Nmx0?=
 =?utf-8?B?OVJVWFBmYTNISE9OSE1Kak5XaDVIL2FpaTVRQ0N6NnUwSnpGRWJ3SHJhNWlL?=
 =?utf-8?B?clJqZkg1dEZiU1V1TDdnU3JSSUk2NnJKK0lka1NCQVpiZ1FrZERWb0p0S1hT?=
 =?utf-8?B?cFlvZ2VBOE9KUFlYem1GV3Z3cTJKeWhqMU9JTVZKbEVlVG1leTFwSzhWaSsv?=
 =?utf-8?B?cm5GbUo4THlHL2ZhdzBYemYyZjM3R1hWbHErMGpES3lZRTJpZHNWcWNycTh5?=
 =?utf-8?Q?66nFLSuCXoohXeSlaAVYxHsrs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4601393-947a-4148-d8cf-08db6149786b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:07:18.5921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4OTT3g+g8qy1ldmAI6dZiCQT0n2X6J0D3qmw9sT+qN9O7LWvbEEK1//dTf/aNUZJz7fCZk4C29sr79+49D6nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Exception events can be generated from interrupts or queue activitity.
>
> The raise event function will save exception status of a queue, device
> or process then notify the debugger of the status change by writing to
> a debugger polled file descriptor that the debugger provides during
> debug attach.
>
> For memory violation exceptions, extra exception data will be saved.
>
> The debugger will be able to query the saved exception states by query
> operation that will be provided by follow up patches.
>
> v2: use new kfd_node struct in prototype.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 104 +++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |   7 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  10 +++
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c |   2 +
>   4 files changed, 123 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 5e2ee2d1acc4..dccb27fc764b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -24,6 +24,107 @@
>   #include "kfd_device_queue_manager.h"
>   #include <linux/file.h>
>   
> +void debug_event_write_work_handler(struct work_struct *work)
> +{
> +	struct kfd_process *process;
> +
> +	static const char write_data = '.';
> +	loff_t pos = 0;
> +
> +	process = container_of(work,
> +			struct kfd_process,
> +			debug_event_workarea);
> +
> +	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
> +}
> +
> +/* update process/device/queue exception status, write to descriptor
> + * only if exception_status is enabled.
> + */
> +bool kfd_dbg_ev_raise(uint64_t event_mask,
> +			struct kfd_process *process, struct kfd_node *dev,
> +			unsigned int source_id, bool use_worker,
> +			void *exception_data, size_t exception_data_size)
> +{
> +	struct process_queue_manager *pqm;
> +	struct process_queue_node *pqn;
> +	int i;
> +	static const char write_data = '.';
> +	loff_t pos = 0;
> +	bool is_subscribed = true;
> +
> +	if (!(process && process->debug_trap_enabled))
> +		return false;
> +
> +	mutex_lock(&process->event_mutex);
> +
> +	if (event_mask & KFD_EC_MASK_DEVICE) {
> +		for (i = 0; i < process->n_pdds; i++) {
> +			struct kfd_process_device *pdd = process->pdds[i];
> +
> +			if (pdd->dev != dev)
> +				continue;
> +
> +			pdd->exception_status |= event_mask & KFD_EC_MASK_DEVICE;
> +
> +			if (event_mask & KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION)) {
> +				if (!pdd->vm_fault_exc_data) {
> +					pdd->vm_fault_exc_data = kmemdup(
> +							exception_data,
> +							exception_data_size,
> +							GFP_KERNEL);
> +					if (!pdd->vm_fault_exc_data)
> +						pr_debug("Failed to allocate exception data memory");
> +				} else {
> +					pr_debug("Debugger exception data not saved\n");
> +					print_hex_dump_bytes("exception data: ",
> +							DUMP_PREFIX_OFFSET,
> +							exception_data,
> +							exception_data_size);
> +				}
> +			}
> +			break;
> +		}
> +	} else if (event_mask & KFD_EC_MASK_PROCESS) {
> +		process->exception_status |= event_mask & KFD_EC_MASK_PROCESS;
> +	} else {
> +		pqm = &process->pqm;
> +		list_for_each_entry(pqn, &pqm->queues,
> +				process_queue_list) {
> +			int target_id;
> +
> +			if (!pqn->q)
> +				continue;
> +
> +			target_id = event_mask & KFD_EC_MASK(EC_QUEUE_NEW) ?
> +					pqn->q->properties.queue_id :
> +							pqn->q->doorbell_id;
> +
> +			if (pqn->q->device != dev || target_id != source_id)
> +				continue;
> +
> +			pqn->q->properties.exception_status |= event_mask;
> +			break;
> +		}
> +	}
> +
> +	if (process->exception_enable_mask & event_mask) {
> +		if (use_worker)
> +			schedule_work(&process->debug_event_workarea);
> +		else
> +			kernel_write(process->dbg_ev_file,
> +					&write_data,
> +					1,
> +					&pos);
> +	} else {
> +		is_subscribed = false;
> +	}
> +
> +	mutex_unlock(&process->event_mutex);
> +
> +	return is_subscribed;
> +}
> +
>   static int kfd_dbg_set_queue_workaround(struct queue *q, bool enable)
>   {
>   	struct mqd_update_info minfo = {0};
> @@ -99,6 +200,9 @@ static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int
>   {
>   	int i;
>   
> +	if (!unwind)
> +		cancel_work_sync(&target->debug_event_workarea);
> +
>   	for (i = 0; i < target->n_pdds; i++) {
>   		struct kfd_process_device *pdd = target->pdds[i];
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index 3e56225f6ef6..66ee7b95d08a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -25,6 +25,11 @@
>   
>   #include "kfd_priv.h"
>   
> +bool kfd_dbg_ev_raise(uint64_t event_mask,
> +			struct kfd_process *process, struct kfd_node *dev,
> +			unsigned int source_id, bool use_worker,
> +			void *exception_data,
> +			size_t exception_data_size);
>   int kfd_dbg_trap_disable(struct kfd_process *target);
>   int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info,
> @@ -35,6 +40,8 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
>   	       KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0);
>   }
>   
> +void debug_event_write_work_handler(struct work_struct *work);
> +
>   /*
>    * If GFX off is enabled, chips that do not support RLC restore for the debug
>    * registers will disable GFX off temporarily for the entire debug session.
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index f0a45d184c8f..b18cd4bf76bf 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -529,6 +529,7 @@ struct queue_properties {
>   	uint32_t ctl_stack_size;
>   	uint64_t tba_addr;
>   	uint64_t tma_addr;
> +	uint64_t exception_status;
>   };
>   
>   #define QUEUE_IS_ACTIVE(q) ((q).queue_size > 0 &&	\
> @@ -820,6 +821,11 @@ struct kfd_process_device {
>   	uint64_t page_in;
>   	uint64_t page_out;
>   
> +	/* Exception code status*/
> +	uint64_t exception_status;
> +	void *vm_fault_exc_data;
> +	size_t vm_fault_exc_data_size;
> +
>   	/* Tracks debug per-vmid request settings */
>   	uint32_t spi_dbg_override;
>   	uint32_t spi_dbg_launch_mode;
> @@ -955,12 +961,16 @@ struct kfd_process {
>   
>   	/* Exception code enable mask and status */
>   	uint64_t exception_enable_mask;
> +	uint64_t exception_status;
>   
>   	/* shared virtual memory registered by this process */
>   	struct svm_range_list svms;
>   
>   	bool xnack_enabled;
>   
> +	/* Work area for debugger event writer worker. */
> +	struct work_struct debug_event_workarea;
> +
>   	/* Tracks debug per-vmid request for debug flags */
>   	bool dbg_flags;
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index a3846bb87510..fa19c1218748 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1509,6 +1509,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
>   	kfd_unref_process(process);
>   	get_task_struct(process->lead_thread);
>   
> +	INIT_WORK(&process->debug_event_workarea, debug_event_write_work_handler);
> +
>   	return process;
>   
>   err_register_notifier:
