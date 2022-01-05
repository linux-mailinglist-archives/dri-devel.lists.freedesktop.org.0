Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF74854FD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 15:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887C510F9DD;
	Wed,  5 Jan 2022 14:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727D10F9D5;
 Wed,  5 Jan 2022 14:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBAD6UQfea8mRg8/m7EteMgDPQyuTass+HdWYXAzIVFLdUtGZPkiYH+bgy5necI1H5VnaanZ22oY7A3iBdQIpDIQBV5IvpnDV4wTz/eG86NRBJ75wUfKlO3Hv232nDO7F8oJzZddMAKXupH7joa1dX8+0a8b9nsjYDIVoKsRphSBaBAJkGw6Cxf5ZSngscu5qDTj890NHE67AOjD0j4I1QNTu5a4vN3ZQtNTztzAy7GjJYJrsGp7AZHAweOyET6U+IdaKU95DCinzvt3/11ZHs+eve4nMza3cLRS+TQL6exQgXBQOwYaAOUeh4uZGSUmOxkhqNkRYypVwIdyxyUSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nz6LbannJCMQOYp7SZeF9R6rZ3VzHQOMc8hqQnHw1XA=;
 b=Pqf99p5Fxx0sSpCtN8jEZlxIGAqxY9vGx4+IO8aQ+tf5G3ZREVybiXQZelqrUcjqbyUBpnN/l71jgFvliMXo0hq/Qx0zGebodm6hQgpoC7AAvzAVFL6jFycQ78cWROGYEjySWLnLvV3y7AF1Vqan6prqylf5psgbKL/vWoXjRFRmcbCnDn6Z/nJzWb6w8teYxKtiupnJZT4TRTOp3/UzLf0/QfMlDIMG/toGRz9omnAYXJ55pKXTA7B9oiHtqVxfI9J1T6yPfDaURQLjX6F8hNOv+gVyEVSFaM+guiq8DroYUOahvaszaFfwhD/lPij3Mlg3VFpQ3wV3KJQMFo8J5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nz6LbannJCMQOYp7SZeF9R6rZ3VzHQOMc8hqQnHw1XA=;
 b=MS6fxuyUZwtNTJl9Uj6hWD+Nob6eqvWbxlFYyAdq/cIUBTtKpvgPuBaCPaDVqbLLjCI3dIu0QIzLZxx0A0c8iT5vxGrDxSH0R5YR3y+hz31bOK11mtDonOtS2jppfLhwEldu35UzxIorUCyDq018eoRsoHd/sno2H4DRYuwCc+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM4PR12MB5183.namprd12.prod.outlook.com (2603:10b6:5:396::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 14:48:17 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 14:48:17 +0000
Subject: Re: [Patch v4 21/24] drm/amdkfd: CRIU Discover svm ranges
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-22-rajneesh.bhardwaj@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <3ca07ca3-ad43-ad2f-d143-be91e8f1df7f@amd.com>
Date: Wed, 5 Jan 2022 09:48:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211223003711.13064-22-rajneesh.bhardwaj@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:610:b0::33) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5168487f-6cba-463b-afcf-08d9d05a68a2
X-MS-TrafficTypeDiagnostic: DM4PR12MB5183:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB51835684FC9D5BB69399E982E64B9@DM4PR12MB5183.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZ1ilCSdt+Zh83LW2ao46nJK/NRiWczM2yQgUwqCkShEEVrD1rX8Bq9tOcmEv5yybHjFpC9pogrtfmJozqJQG+YMoHsyk7lqO+XN33sU4Qk1wlN+SplsdJSXrDJT9zKJfggL7hSSGx9JISFJcugRllNpks2VTXX7/og3gTCkZd1kyFpAoR/nc2OmP5pIBRefJepWoVuMnuDMDLw4Gf/EAE37rOol/7udX+V98YSr1fLbdneO/FC9ypDNqhrOlOjnq20y/XcLILyZnG7UEUS7fPDHrDkP2jzscjzyWzzaZUJgQhmLpC9KgINnjjcizv7EzSlpejR4n6jWeuk+TCtpyUo74HE140ZO30vXZE3Ed8ncXqKaZ0MRYheOgeYjDhwhazh1ENfnviSeodOe4GrJMT9OIeifS8WDE9ZAqM2gUzz6nBPpoltyummkkeGKhSxkHNFsyVUcDNPV4HAiJsVBnELQZgUQfqpk4zQYrmYJ0PBT/oKrsZUwjduYyg1pnY6wV+9haixGuECt8+jgyy7JoKdByXZdXqu9nH4sygyk3JiD261mmbzVSQnuo5aRiODq6fyJaJT9LI76JczqhUhxTIZmyWtnt9cPrm/zjFROwlm7T3DllDRYYyXtY53+Y40+HD8b47Q+ACE1vB2X8UO8yZfBOfE090rYk8OfOFa9vDp01pQpgt5LXR6PbI1gXJfXWbcCVNJQ3Tmxd6aARDxQ+fuUjakP2jMUW31u+rwVqAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(66556008)(6512007)(186003)(53546011)(36756003)(5660300002)(31696002)(4001150100001)(6506007)(508600001)(4326008)(26005)(2906002)(2616005)(38100700002)(316002)(31686004)(83380400001)(66476007)(66946007)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHdXWWVMalFtSVM2a1A5ZGZtVWJucWVoTnlYUVlCYk5MdzBrejhQajZNSXdI?=
 =?utf-8?B?SjRFdGpqcnlpYTBjV0crUWxLZDBJSTZVOEw3amlyYmVaQVNVOXpNV1dVYnNI?=
 =?utf-8?B?b0tRcm5OYmd3N01COUhYNzl4bDBVSmZYeHVOOWxkRVNRT2hKVVhiRUxuektH?=
 =?utf-8?B?ejFyWUpaTHZ1Zy84Vy8vajhMdkl3cEtMVTVMbmoycVFnSUY4OHNncEdpRk45?=
 =?utf-8?B?V1EwQnY0U1dKbStKbGozWFVDSElScFNLNFBLc1Y0WjhlMW5FaEpFbUdNcVlu?=
 =?utf-8?B?d0pTamtCZWoxakhLUWEveWgraXRGemZQaklHdWNZZVBOaGc3Ym41bGx1N3Ew?=
 =?utf-8?B?ZUxZTDk1dW80WmxPOTBCc1IxZTcwQXhYRnlQeVpPOHVEaWdtcUVqelNReEJ1?=
 =?utf-8?B?K1RweGxvUDBQZmZxRWE2VzVIQ2p2ekcrMzdwd010WWFiZFJrNnRjTnVlQVdl?=
 =?utf-8?B?aWNuWGxOY3MyOGYzenMrTEF4VXhkUkVxN2NDbnhBbWNuMmVTL0J2WFRRUEx4?=
 =?utf-8?B?bEFDZ2tKUFhFVUIzOGp6aUdsNitIU2VFQTZ0eTZYZVozM1hKZzE3ZDl0RDJk?=
 =?utf-8?B?YUNGckdzMjBKRW9sdEtjNEsyZExDbTJXMXpwaGxadU0zdEtTVGV6Wk1NQTNi?=
 =?utf-8?B?N2I2VWROTWFpMVZyd1BEbjU1bktEc2VlUXdzb05BSXFjL2FKRWtveEV0OTFG?=
 =?utf-8?B?UUlsMXA1OGdJSlEwNEdEMkFtR0xGWHBWVnNMcWZJSERacHkwUG1WNzJTRE53?=
 =?utf-8?B?NGRsV1dEOVV4NHdYOEEyVmRCbzBzLzkyVE1UVW9jUTdLSUpYNXFVNUpuUEhI?=
 =?utf-8?B?QjA4bzN5andyeDk4UU5QVDdUbXhEOW9qKzdCL2w2cTBma1g1Q2Flb2xjNHJY?=
 =?utf-8?B?TG1na2ZBcnZ5VWhHZVNiZzBYN0pGZFF0OVlndDZmVVo0aTM5NTI4MWZpZGh5?=
 =?utf-8?B?WmdQdU80aS9IODdTaHczdXdlT1Y1b0ljUVMrVC96MEpicnpSNU1wOXVweDVv?=
 =?utf-8?B?UUc0U0Izdzd3SkV6a0ZNU3hseWJ3VmdIdDRvVWJJdGNheXNNQStLelVob0Ro?=
 =?utf-8?B?WDJJREZZd2FoSjBDM2cxbGZpemxYQlptWnhuQWZCazV1NlVtOHBGV2FwbXZJ?=
 =?utf-8?B?TFVncDJQZ0E1Um1LYWR6UmhTY0UyVVF6Q1JGNVQzaXpOMk84OGYrWHg1WWVK?=
 =?utf-8?B?TmhKK3VDVkpiWndVRkZuU21ZblpZVW8vWTVyMHNMUUpnQWRmSFZXazVOK3FX?=
 =?utf-8?B?dEl2U3dQVWwvYzlzQVl0NjVhK2UzalYwRjF0d3hNSWNnODFrN1dJUHVOZVdT?=
 =?utf-8?B?bTA4UTdJTVVPMG5JSVZvdzkrSVFkK05PR1RTOWxwSWROREtSc2FLa1NBZTFj?=
 =?utf-8?B?S00zbDVIMGJGaW90RmFiTlNVbVB2V1djTXJoVGJ5VzZ0Zm04Y1E4bEtxUy9p?=
 =?utf-8?B?STc5YnlrTHBRZjNhWGNDRHYxS1g5L0hHOGpiREQ3dllUc2FRYjYvakZuSkdx?=
 =?utf-8?B?WE4veEZIUFFSWU5SQjZZb0NqYXdJc3FGMGNrVHZLYVgraHFQVGdubmd3SEVv?=
 =?utf-8?B?eUtZKzROYkxWZGM1STJ5V1BVay9NNzVCSTZYeEI5eUpwV3M1Qk55eEt1Zk9W?=
 =?utf-8?B?NS9rakxJSUNjQVNJOU9OQ1gyZUJCOXpDWlBSd0RoMEtNbGk0a3VwNTd6dkVZ?=
 =?utf-8?B?dHE0ZEZ1TUVQdkFLUlExa2pnRVpvcm13Sm53N1F4V2lERE92QjdsemlqU2FV?=
 =?utf-8?B?alhjVExiSjdxV2tBRGc2N3d5RVViU2lvMXBpZUlBN2ZLYnZiWXZXblFUT24x?=
 =?utf-8?B?ZDBRaUtpYjFtL3o5Zzg3R21acU50cUZwWGNpd1BJZEZkdkZDbzJkU043ODlo?=
 =?utf-8?B?Yk5UT3pxZFFJcmxzMnlydHVlUVRRelBiZytFK2RPdUUrVHZ5amw1T1lPZnB2?=
 =?utf-8?B?WGdydDdtaVg0TmFyMU1KQzhQL0RGaHVyV1dSTGltQ3BraCtEckFiWmNvK2ha?=
 =?utf-8?B?d1pFVVgvV3EvYVVZSmhldHVqNmh1a1R2Q2NINmJIK3QxKytZeFB3bWdqV2h1?=
 =?utf-8?B?a0hrUzVhWDNpWXFMcU9HNzNTVTFLRVFxRXlrQlpDekd0OUVQdUdxQ0dvK2lC?=
 =?utf-8?Q?UmHs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5168487f-6cba-463b-afcf-08d9d05a68a2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 14:48:17.2636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFI6cl8MjWTjcV6ceG8N25HedhvsAYmvMo0Uay1Bjfuzf5mcKpyN+MCtKQxgd4ik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5183
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 christian.koenig@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-12-22 7:37 p.m., Rajneesh
      Bhardwaj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211223003711.13064-22-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">A KFD process may contain a number of virtual address ranges for shared
virtual memory management and each such range can have many SVM
attributes spanning across various nodes within the process boundary.
This change reports the total number of such SVM ranges and
their total private data size by extending the PROCESS_INFO op of the the
CRIU IOCTL to discover the svm ranges in the target process and a future
patches brings in the required support for checkpoint and restore for
SVM ranges.


Signed-off-by: Rajneesh Bhardwaj <a class="moz-txt-link-rfc2396E" href="mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 60 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h     | 11 +++++
 4 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 446eb9310915..1c25d5e9067c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -2089,10 +2089,9 @@ static int criu_get_process_object_info(struct kfd_process *p,
 					uint32_t *num_objects,
 					uint64_t *objs_priv_size)
 {
-	int ret;
-	uint64_t priv_size;
+	uint64_t queues_priv_data_size, svm_priv_data_size, priv_size;
 	uint32_t num_queues, num_events, num_svm_ranges;
-	uint64_t queues_priv_data_size;
+	int ret;
 
 	*num_devices = p-&gt;n_pdds;
 	*num_bos = get_process_num_bos(p);
@@ -2102,7 +2101,10 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		return ret;
 
 	num_events = kfd_get_num_events(p);
-	num_svm_ranges = 0; /* TODO: Implement SVM-Ranges */
+
+	ret = svm_range_get_info(p, &amp;num_svm_ranges, &amp;svm_priv_data_size);
+	if (ret)
+		return ret;
 
 	*num_objects = num_queues + num_events + num_svm_ranges;
 
@@ -2112,7 +2114,7 @@ static int criu_get_process_object_info(struct kfd_process *p,
 		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
 		priv_size += queues_priv_data_size;
 		priv_size += num_events * sizeof(struct kfd_criu_event_priv_data);
-		/* TODO: Add SVM ranges priv size */
+		priv_size += svm_priv_data_size;
 		*objs_priv_size = priv_size;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index d72dda84c18c..87eb6739a78e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1082,7 +1082,10 @@ enum kfd_criu_object_type {
 
 struct kfd_criu_svm_range_priv_data {
 	uint32_t object_type;
-	uint64_t reserved;
+	uint64_t start_addr;
+	uint64_t size;
+	/* Variable length array of attributes */
+	struct kfd_ioctl_svm_attribute attrs[0];
 };
 
 struct kfd_criu_queue_priv_data {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7c92116153fe..49e05fb5c898 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -3418,6 +3418,66 @@ svm_range_get_attr(struct kfd_process *p, struct mm_struct *mm,
 	return 0;
 }
 
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size)
+{
+	uint64_t total_size, accessibility_size, common_attr_size;
+	int nattr_common = 4, naatr_accessibility = 1;</pre>
    </blockquote>
    <p>number of SVM range attributes may be increased in future, better
      to define MACRO for nattr_common and nattr_accessibility (typo),
      then use MACRO in following patches too.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20211223003711.13064-22-rajneesh.bhardwaj@amd.com">
      <pre class="moz-quote-pre" wrap="">
+	int num_devices = p-&gt;n_pdds;
+	struct svm_range_list *svms;
+	struct svm_range *prange;
+	uint32_t count = 0;
+
+	*svm_priv_data_size = 0;
+
+	svms = &amp;p-&gt;svms;
+	if (!svms)
+		return -EINVAL;
+
+	mutex_lock(&amp;svms-&gt;lock);
+	list_for_each_entry(prange, &amp;svms-&gt;list, list) {
+		pr_debug(&quot;prange: 0x%p start: 0x%lx\t npages: 0x%llx\t end: 0x%llx\n&quot;,
+			 prange, prange-&gt;start, prange-&gt;npages,
+			 prange-&gt;start + prange-&gt;npages - 1);
+		count++;
+	}
+	mutex_unlock(&amp;svms-&gt;lock);
+
+	*num_svm_ranges = count;
+	/* Only the accessbility attributes need to be queried for all the gpus
+	 * individually, remaining ones are spanned across the entire process
+	 * regardless of the various gpu nodes. Of the remaining attributes,
+	 * KFD_IOCTL_SVM_ATTR_CLR_FLAGS need not be saved.
+	 *
+	 * KFD_IOCTL_SVM_ATTR_PREFERRED_LOC
+	 * KFD_IOCTL_SVM_ATTR_PREFETCH_LOC
+	 * KFD_IOCTL_SVM_ATTR_SET_FLAGS
+	 * KFD_IOCTL_SVM_ATTR_GRANULARITY
+	 *
+	 * ** ACCESSBILITY ATTRIBUTES **
+	 * (Considered as one, type is altered during query, value is gpuid)
+	 * KFD_IOCTL_SVM_ATTR_ACCESS
+	 * KFD_IOCTL_SVM_ATTR_ACCESS_IN_PLACE
+	 * KFD_IOCTL_SVM_ATTR_NO_ACCESS
+	 */
+	if (*num_svm_ranges &gt; 0)
+	{
+		common_attr_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			nattr_common;
+		accessibility_size = sizeof(struct kfd_ioctl_svm_attribute) *
+			naatr_accessibility * num_devices;
+
+		total_size = sizeof(struct kfd_criu_svm_range_priv_data) +
+			common_attr_size + accessibility_size;
+
+		*svm_priv_data_size = *num_svm_ranges * total_size;
+	}
+
+	pr_debug(&quot;num_svm_ranges %u total_priv_size %llu\n&quot;, *num_svm_ranges,
+		 *svm_priv_data_size);
+	return 0;
+}
+
 int
 svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 	  uint64_t size, uint32_t nattrs, struct kfd_ioctl_svm_attribute *attrs)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index 6dc91c33e80f..c8c1251920d4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -186,6 +186,8 @@ void svm_range_dma_unmap(struct device *dev, dma_addr_t *dma_addr,
 void svm_range_free_dma_mappings(struct svm_range *prange);
 void svm_range_prefault(struct svm_range *prange, struct mm_struct *mm,
 			void *owner);
+int svm_range_get_info(struct kfd_process *p, uint32_t *num_svm_ranges,
+		       uint64_t *svm_priv_data_size);
 struct kfd_process_device *
 svm_range_get_pdd_by_adev(struct svm_range *prange, struct amdgpu_device *adev);
 void svm_range_list_lock_and_flush_work(struct svm_range_list *svms, struct mm_struct *mm);
@@ -223,6 +225,15 @@ static inline int svm_range_schedule_evict_svm_bo(
 	return -EINVAL;
 }
 
+static inline int svm_range_get_info(struct kfd_process *p,
+				     uint32_t *num_svm_ranges,
+				     uint64_t *svm_priv_data_size)
+{
+	*num_svm_ranges = 0;
+	*svm_priv_data_size = 0;
+	return 0;
+}
+
 #define KFD_IS_SVM_API_SUPPORTED(dev) false
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
</pre>
    </blockquote>
  </body>
</html>
