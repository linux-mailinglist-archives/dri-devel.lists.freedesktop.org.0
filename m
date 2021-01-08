Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D9D2EF5BD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 17:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826A76E83F;
	Fri,  8 Jan 2021 16:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB146E839
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610123483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hm2iTN4Ch7eQ7rVA/cjFV3xEn4oZYCZuK1hpWr0tCPQ=;
 b=Iw/be1nS6i2+P5ksD8yGtW2nGtwpLY00YfxMIJOaJl8TLn3/25aGopdhnE+fzLQrzfEQ5H
 E2UhMV6BFs6Fyz4IZmdp/PUk+3oDpwtoVzRy4oX8ECS4Rp7niZ83IQwghFGUfZYvZxvX8/
 rurCRwnz6/HuhjhpO0CzF6fxqq/22K0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-ohvJnYkXOw-bIgvrr-cL_w-1; Fri, 08 Jan 2021 11:31:19 -0500
X-MC-Unique: ohvJnYkXOw-bIgvrr-cL_w-1
Received: by mail-qt1-f199.google.com with SMTP id m21so4597084qtp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 08:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hm2iTN4Ch7eQ7rVA/cjFV3xEn4oZYCZuK1hpWr0tCPQ=;
 b=JyyaUDyJFPMJsbYthGtoLuA4dKAMTRuCbfA62Jq3IFkd+yFWAK+hnRYD6EAY38GiZL
 iy/tKjlnbk/GUnTkUuvlJ/877naL1vTFoInvuyXKRFTyiIvpwdbOjLLupERu61pOsbPU
 Q4YetWIVAnO2Z3b+Qs25/ydKoQ9NWMp6F8uCQFra7OieWUxBAD6VVYC3VSblOq7NvSrN
 0ng2MyhmEqSa59ft8SIt/k5EnncntMILuZ64jB36U+Q8hcEUl1CnAkcbG9ciZ8wFxxha
 goxNKncfAS/Jw+ZUZ5H+D1N37gNDpDB6/UNQbdeIRHAhs1uCV8bpAUUNma6c2SBTMayW
 BsGw==
X-Gm-Message-State: AOAM532ueRH61fMs079SyhM2NLpPV1Sl/YgFBJLAB9kGm6krCANVR8Yz
 2d4DbXPtoa3rVN3tHDnayPGeznW13HnQ2zsYemFlU+SEoD5qiMJvxeQoKL05HkXglfAssI4ytNp
 hI5HAlHVxr/5Cupac8T7phFKkRbXN
X-Received: by 2002:ac8:51d8:: with SMTP id d24mr4135466qtn.73.1610123478678; 
 Fri, 08 Jan 2021 08:31:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBnGy1jCLvkpt/z1jwaPxBdD90nC52UKT9/YFaMGtjVtSVhqQal7YRrNSavwFt1MBOyKYr2Q==
X-Received: by 2002:ac8:51d8:: with SMTP id d24mr4135443qtn.73.1610123478342; 
 Fri, 08 Jan 2021 08:31:18 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a63a:4d01:c440:5c61:43ba:350c])
 by smtp.gmail.com with ESMTPSA id 14sm4989879qkv.25.2021.01.08.08.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:31:17 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amdkfd: Fix out-of-bounds read in
 kdf_create_vcrat_image_cpu()
Date: Fri,  8 Jan 2021 11:31:04 -0500
Message-Id: <20210108163104.411442-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>,
 amd-gfx@lists.freedesktop.org, Kent Russell <kent.russell@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KASAN reported a slab-out-of-bounds read of size 1 in
kdf_create_vcrat_image_cpu().

This occurs when, for example, when on an x86_64 with a single NUMA node
because kfd_fill_iolink_info_for_cpu() is a no-op, but afterwards the
sub_type_hdr->length, which is out-of-bounds, is read and multiplied by
entries. Fortunately, entries is 0 in this case so the overall
crat_table->length is still correct.

This refactors the helper functions to accept the crat_table directly
and calculate the table entry pointer based on the current table length.
This allows us to avoid an out-of-bounds read and hopefully makes the
pointer arithmetic clearer. It should have no functional change beyond
removing the out-of-bounds read.

Fixes: b7b6c38529c9 ("drm/amdkfd: Calculate CPU VCRAT size dynamically (v2)")
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c | 86 +++++++++++++--------------
 1 file changed, 40 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 8cac497c2c45..e50db2c0f4ee 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -829,21 +829,24 @@ int kfd_create_crat_image_acpi(void **crat_image, size_t *size)
 /* kfd_fill_cu_for_cpu - Fill in Compute info for the given CPU NUMA node
  *
  *	@numa_node_id: CPU NUMA node id
- *	@avail_size: Available size in the memory
- *	@sub_type_hdr: Memory into which compute info will be filled in
+ *	@avail_size: Available space in bytes at the end of the @crat_table.
+ *	@crat_table: The CRAT table to append the Compute info to;
+ *		on success the table length and total_entries count is updated.
  *
  *	Return 0 if successful else return -ve value
  */
 static int kfd_fill_cu_for_cpu(int numa_node_id, int *avail_size,
-				int proximity_domain,
-				struct crat_subtype_computeunit *sub_type_hdr)
+				struct crat_header *crat_table)
 {
 	const struct cpumask *cpumask;
+	struct crat_subtype_computeunit *sub_type_hdr;
 
 	*avail_size -= sizeof(struct crat_subtype_computeunit);
 	if (*avail_size < 0)
 		return -ENOMEM;
 
+	sub_type_hdr = (typeof(sub_type_hdr))((char *)crat_table +
+		crat_table->length);
 	memset(sub_type_hdr, 0, sizeof(struct crat_subtype_computeunit));
 
 	/* Fill in subtype header data */
@@ -855,36 +858,42 @@ static int kfd_fill_cu_for_cpu(int numa_node_id, int *avail_size,
 
 	/* Fill in CU data */
 	sub_type_hdr->flags |= CRAT_CU_FLAGS_CPU_PRESENT;
-	sub_type_hdr->proximity_domain = proximity_domain;
+	sub_type_hdr->proximity_domain = crat_table->num_domains;
 	sub_type_hdr->processor_id_low = kfd_numa_node_to_apic_id(numa_node_id);
 	if (sub_type_hdr->processor_id_low == -1)
 		return -EINVAL;
 
 	sub_type_hdr->num_cpu_cores = cpumask_weight(cpumask);
 
+	crat_table->length += sub_type_hdr->length;
+	crat_table->total_entries++;
+
 	return 0;
 }
 
 /* kfd_fill_mem_info_for_cpu - Fill in Memory info for the given CPU NUMA node
  *
  *	@numa_node_id: CPU NUMA node id
- *	@avail_size: Available size in the memory
- *	@sub_type_hdr: Memory into which compute info will be filled in
+ *	@avail_size: Available space in bytes at the end of the @crat_table.
+ *	@crat_table: The CRAT table to append the Memory info to;
+ *		on success the table length and total_entries count is updated.
  *
  *	Return 0 if successful else return -ve value
  */
 static int kfd_fill_mem_info_for_cpu(int numa_node_id, int *avail_size,
-			int proximity_domain,
-			struct crat_subtype_memory *sub_type_hdr)
+			struct crat_header *crat_table)
 {
 	uint64_t mem_in_bytes = 0;
 	pg_data_t *pgdat;
 	int zone_type;
+	struct crat_subtype_memory *sub_type_hdr;
 
 	*avail_size -= sizeof(struct crat_subtype_memory);
 	if (*avail_size < 0)
 		return -ENOMEM;
 
+	sub_type_hdr = (typeof(sub_type_hdr))((char *)crat_table +
+		crat_table->length);
 	memset(sub_type_hdr, 0, sizeof(struct crat_subtype_memory));
 
 	/* Fill in subtype header data */
@@ -905,27 +914,37 @@ static int kfd_fill_mem_info_for_cpu(int numa_node_id, int *avail_size,
 
 	sub_type_hdr->length_low = lower_32_bits(mem_in_bytes);
 	sub_type_hdr->length_high = upper_32_bits(mem_in_bytes);
-	sub_type_hdr->proximity_domain = proximity_domain;
+	sub_type_hdr->proximity_domain = crat_table->num_domains;
+
+	crat_table->length += sub_type_hdr->length;
+	crat_table->total_entries++;
 
 	return 0;
 }
 
 #ifdef CONFIG_X86_64
+/* kfd_fill_iolink_info_for_cpu() - Add IO link info to a Virtual CRAT
+ *
+ * @numa_node_id: The NUMA node ID for the CPU; as from for_each_online_node()
+ * @avail_size: Available space in bytes at the end of the @crat_table.
+ * @crat_table: The CRAT table to append the IO link info to; on success the
+ *              table length and total_entries count is updated.
+ *
+ * Return: 0 if successful else return -ve value
+ */
 static int kfd_fill_iolink_info_for_cpu(int numa_node_id, int *avail_size,
-				uint32_t *num_entries,
-				struct crat_subtype_iolink *sub_type_hdr)
+				struct crat_header *crat_table)
 {
 	int nid;
 	struct cpuinfo_x86 *c = &cpu_data(0);
 	uint8_t link_type;
+	struct crat_subtype_iolink *sub_type_hdr;
 
 	if (c->x86_vendor == X86_VENDOR_AMD)
 		link_type = CRAT_IOLINK_TYPE_HYPERTRANSPORT;
 	else
 		link_type = CRAT_IOLINK_TYPE_QPI_1_1;
 
-	*num_entries = 0;
-
 	/* Create IO links from this node to other CPU nodes */
 	for_each_online_node(nid) {
 		if (nid == numa_node_id) /* node itself */
@@ -935,6 +954,8 @@ static int kfd_fill_iolink_info_for_cpu(int numa_node_id, int *avail_size,
 		if (*avail_size < 0)
 			return -ENOMEM;
 
+		sub_type_hdr = (typeof(sub_type_hdr))((char *)crat_table +
+			crat_table->length);
 		memset(sub_type_hdr, 0, sizeof(struct crat_subtype_iolink));
 
 		/* Fill in subtype header data */
@@ -947,8 +968,8 @@ static int kfd_fill_iolink_info_for_cpu(int numa_node_id, int *avail_size,
 		sub_type_hdr->proximity_domain_to = nid;
 		sub_type_hdr->io_interface_type = link_type;
 
-		(*num_entries)++;
-		sub_type_hdr++;
+		crat_table->length += sub_type_hdr->length;
+		crat_table->total_entries++;
 	}
 
 	return 0;
@@ -966,12 +987,8 @@ static int kfd_create_vcrat_image_cpu(void *pcrat_image, size_t *size)
 	struct crat_header *crat_table = (struct crat_header *)pcrat_image;
 	struct acpi_table_header *acpi_table;
 	acpi_status status;
-	struct crat_subtype_generic *sub_type_hdr;
 	int avail_size = *size;
 	int numa_node_id;
-#ifdef CONFIG_X86_64
-	uint32_t entries = 0;
-#endif
 	int ret = 0;
 
 	if (!pcrat_image)
@@ -1003,48 +1020,25 @@ static int kfd_create_vcrat_image_cpu(void *pcrat_image, size_t *size)
 	crat_table->total_entries = 0;
 	crat_table->num_domains = 0;
 
-	sub_type_hdr = (struct crat_subtype_generic *)(crat_table+1);
-
 	for_each_online_node(numa_node_id) {
 		if (kfd_numa_node_to_apic_id(numa_node_id) == -1)
 			continue;
 
 		/* Fill in Subtype: Compute Unit */
-		ret = kfd_fill_cu_for_cpu(numa_node_id, &avail_size,
-			crat_table->num_domains,
-			(struct crat_subtype_computeunit *)sub_type_hdr);
+		ret = kfd_fill_cu_for_cpu(numa_node_id, &avail_size, crat_table);
 		if (ret < 0)
 			return ret;
-		crat_table->length += sub_type_hdr->length;
-		crat_table->total_entries++;
-
-		sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
-			sub_type_hdr->length);
 
 		/* Fill in Subtype: Memory */
-		ret = kfd_fill_mem_info_for_cpu(numa_node_id, &avail_size,
-			crat_table->num_domains,
-			(struct crat_subtype_memory *)sub_type_hdr);
+		ret = kfd_fill_mem_info_for_cpu(numa_node_id, &avail_size, crat_table);
 		if (ret < 0)
 			return ret;
-		crat_table->length += sub_type_hdr->length;
-		crat_table->total_entries++;
-
-		sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
-			sub_type_hdr->length);
 
 		/* Fill in Subtype: IO Link */
 #ifdef CONFIG_X86_64
-		ret = kfd_fill_iolink_info_for_cpu(numa_node_id, &avail_size,
-				&entries,
-				(struct crat_subtype_iolink *)sub_type_hdr);
+		ret = kfd_fill_iolink_info_for_cpu(numa_node_id, &avail_size, crat_table);
 		if (ret < 0)
 			return ret;
-		crat_table->length += (sub_type_hdr->length * entries);
-		crat_table->total_entries += entries;
-
-		sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
-				sub_type_hdr->length * entries);
 #else
 		pr_info("IO link not available for non x86 platforms\n");
 #endif
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
