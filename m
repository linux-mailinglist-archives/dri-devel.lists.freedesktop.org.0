Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25935807078
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFA310E725;
	Wed,  6 Dec 2023 13:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AC510E725
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:01:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-332f90a375eso694035f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701867712; x=1702472512; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PDpleMyJHigQONDTtKiybtPKcqyzKByzNSEF5ilEj9U=;
 b=uAOiW31/DaYnVASO+rrwOXIS91bqC5l6kKwdRnmY9NW4ofLUfz2fnV9A7O0YZGb3ig
 dvbPbCXaUTcLJ2fLZeDAqNL55S/efG2Ja8iHEXrLmZ9TAo14NHbCc5TOezBCrMRQ+89d
 B74AIgaCpcU9LXPUBqB3406SE60pkXSxFKVUakJuchSzXyiTnUiCHyxp5ngbLNzESdqt
 AjRT5VONlkFwoGMe3kqnOWrvE62KGeV8AKF5EfYucpe/KiTXvX3dblDNHHnV31mheeR+
 Yu7LsnJGB8u1JFRrBqJ3+CefHOe7R6K7Rl6VORy2Ua+tJaP13Sbab/2XpLerbZw2MmMh
 EpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701867712; x=1702472512;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PDpleMyJHigQONDTtKiybtPKcqyzKByzNSEF5ilEj9U=;
 b=rGcOh91pkJhR4gCFogTH10xnJWQjGKOylhvoMpfzZ+mRntdK2GQBB9HVifjjnV0Nfd
 qOuVf6Z5HwPgqVuOA4mXKnM0SghCbOpL6tsegCDT/QN2ZVKouGhwOLQNX7Xe+rNU3IYR
 jurUAwCn31fBN8Wf5+5DpGmJ8t64rkII2hhBUf5Fn7SvpqQqH9FObESw6kbj7t4QBkCn
 2slwFuWQe3XDf3d43ixan9y/9qmOAv+QZhsgMybnOFU6qg4VzfTtIcZm7iHrETPHRRxP
 v6DVIuHMD+gN4nFYmNz19ggAt1yVfb8FPcLvwJpKoXyBT40dkSaZ8icqwo6L6NGUqTPt
 M34w==
X-Gm-Message-State: AOJu0Yysti+NBQRbU9zK9h9H8jj00ztCyL+c2eBpNtTNluXYxmIAeIwx
 A6ckA09rvy1z72gBLtzxycopUO3OiHzfX9Ilrr8=
X-Google-Smtp-Source: AGHT+IGjVT+hFvh7/SZ11MZHg1d4Sd8Mg21kSjlNW9x8ts7zXKEc01JF78greVolnzLCw3tbfaLe2Q==
X-Received: by 2002:a5d:6742:0:b0:333:1a1c:50f8 with SMTP id
 l2-20020a5d6742000000b003331a1c50f8mr512295wrw.2.1701867712444; 
 Wed, 06 Dec 2023 05:01:52 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 i18-20020adfefd2000000b003334a1e92dasm7742025wrp.70.2023.12.06.05.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 05:01:52 -0800 (PST)
Date: Wed, 6 Dec 2023 16:01:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sarah.walker@imgtec.com
Subject: [bug report] drm/imagination: Implement MIPS firmware processor and
 MMU support
Message-ID: <f9da2073-be56-4497-8113-807fa90e05ed@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sarah Walker,

The patch 927f3e0253c1: "drm/imagination: Implement MIPS firmware
processor and MMU support" from Nov 22, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/gpu/drm/imagination/pvr_vm_mips.c:204 pvr_vm_mips_map()
	warn: 'pfn' can be negative (type promoted to high)

drivers/gpu/drm/imagination/pvr_vm_mips.c
    144 int
    145 pvr_vm_mips_map(struct pvr_device *pvr_dev, struct pvr_fw_object *fw_obj)
    146 {
    147         struct pvr_fw_device *fw_dev = &pvr_dev->fw_dev;
    148         struct pvr_fw_mips_data *mips_data = fw_dev->processor_data.mips_data;
    149         struct pvr_gem_object *pvr_obj = fw_obj->gem;
    150         const u64 start = fw_obj->fw_mm_node.start;
    151         const u64 size = fw_obj->fw_mm_node.size;
    152         u64 end;
    153         u32 cache_policy;
    154         u32 pte_flags;
    155         u32 start_pfn;
    156         u32 end_pfn;
    157         s32 pfn;

pfn is s32 but start_pfn is u32.

    158         int err;
    159 
    160         if (check_add_overflow(start, size - 1, &end))
    161                 return -EINVAL;
    162 
    163         if (start < ROGUE_FW_HEAP_BASE ||
    164             start >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
    165             end < ROGUE_FW_HEAP_BASE ||
    166             end >= ROGUE_FW_HEAP_BASE + fw_dev->fw_heap_info.raw_size ||
    167             (start & ROGUE_MIPSFW_PAGE_MASK_4K) ||
    168             ((end + 1) & ROGUE_MIPSFW_PAGE_MASK_4K))
    169                 return -EINVAL;
    170 
    171         start_pfn = (start & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;

Can start_pfn be zero?

    172         end_pfn = (end & fw_dev->fw_heap_info.offset_mask) >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K;
    173 
    174         if (pvr_obj->flags & PVR_BO_FW_FLAGS_DEVICE_UNCACHED)
    175                 cache_policy = ROGUE_MIPSFW_UNCACHED_CACHE_POLICY;
    176         else
    177                 cache_policy = mips_data->cache_policy;
    178 
    179         pte_flags = get_mips_pte_flags(true, true, cache_policy);
    180 
    181         for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
    182                 dma_addr_t dma_addr;
    183                 u32 pte;
    184 
    185                 err = pvr_fw_object_get_dma_addr(fw_obj,
    186                                                  (pfn - start_pfn) <<
    187                                                  ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K,
    188                                                  &dma_addr);
    189                 if (err)
    190                         goto err_unmap_pages;
    191 
    192                 pte = ((dma_addr >> ROGUE_MIPSFW_LOG2_PAGE_SIZE_4K)
    193                        << ROGUE_MIPSFW_ENTRYLO_PFN_SHIFT) & mips_data->pfn_mask;
    194                 pte |= pte_flags;
    195 
    196                 WRITE_ONCE(mips_data->pt[pfn], pte);
    197         }
    198 
    199         pvr_mmu_flush_request_all(pvr_dev);
    200 
    201         return 0;
    202 
    203 err_unmap_pages:
--> 204         for (; pfn >= start_pfn; pfn--)
                       ^^^^^^^^^^^^^^^^
If start_pfn can be zero then this is an endless loop.  I've seen this
code in other places as well.  This loop is slightly off as well.  It
should decrement pfn on the first iteration.

There are hack arounds for using unsigned iterators:

	while (pfn-- > start_pfn)
		WRITE_ONCE(mips_data->pt[pfn], 0);

Personally I would be tempted to make things signed...  Here are some
links to various rants I have wrote:
https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/
https://staticthinking.wordpress.com/2023/07/25/wsign-compare-is-garbage/
You didn't ask for rants...  No one ever asks for rants...

    205                 WRITE_ONCE(mips_data->pt[pfn], 0);
    206 
    207         pvr_mmu_flush_request_all(pvr_dev);
    208         WARN_ON(pvr_mmu_flush_exec(pvr_dev, true));
    209 
    210         return err;
    211 }

regards,
dan carpenter
